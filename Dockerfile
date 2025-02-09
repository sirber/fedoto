# Builder
FROM node:22-alpine AS builder
WORKDIR /app
COPY package.json package-lock.json* pnpm-lock.yaml* yarn.lock* ./
RUN if [ -f package-lock.json ]; then npm ci; \
    elif [ -f yarn.lock ]; then yarn install --frozen-lockfile; \
    elif [ -f pnpm-lock.yaml ]; then pnpm install --frozen-lockfile; \
    else echo "No lockfile found. Exiting..." && exit 1; fi
COPY . .
RUN npx prisma generate
RUN npm run worker:build
RUN npm run build

# Worker
FROM node:22-alpine AS worker
WORKDIR /app
COPY --from=builder /app/dist ./dist
ENV NODE_ENV=production
CMD ["node", "dist/worker.js"]

# App
FROM node:22-alpine AS app
WORKDIR /app
COPY --from=builder /app/.next/standalone .
ENV NODE_ENV=production
EXPOSE 3000
CMD ["node", ".next/standalone/server.js"]
