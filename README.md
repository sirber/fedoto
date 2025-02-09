# Fedoto

ActivityPub and Mastodon compatible photo sharing service.

## Development

### Requirements

- Docker
- NodeJS, installed via NVM

### Bootstrap
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

## Hosting

TODO