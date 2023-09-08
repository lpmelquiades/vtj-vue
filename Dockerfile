FROM 20.6.0-bullseye-slim AS base

WORKDIR /var/www

COPY src/ ./src
COPY public/ ./public
COPY package-lock.json .
COPY package.json .
COPY tsconfig.json .
COPY tsconfig.app.json .


FROM source AS dev
RUN npm ci

COPY __tests__/ ./__tests__
COPY vitest.config.ts .
COPY vite.config.ts

EXPOSE 3000

ENTRYPOINT ["/usr/local/bin/npm", "run", "dev"]
