# Fedoto

Photo Sharing service for everyone

## Goal of this project

- Share and Comment photos over the federated servers
- Be compatible with ActivityPub and Mastodon clients
- Be fast and efficient

# Development

## Requirements

- NodeJS, installed via NVM
- Docker

## Stack

- NodeJS 22
- NextJS 15
- PostgreSQL 17
- Redis 7

## Bootstrap
Create a .env with
```
DATABASE_URL="postgresql://fedoto:fedoto@localhost:5432/fedoto"
```

Then run:
```bash
nvm use
npm install
docker compose up -d
npm run migrate
```

# Hosting

## Build Docker images

```bash
docker build --target migrate -t fedoto-migrate .
docker build --target app -t fedoto-app .
docker build --target worker -t fedoto-worker .
``` 