FROM node:20.6.0-bullseye-slim AS source

WORKDIR /var/www

COPY public/ ./public
COPY src/ ./src

COPY env.d.ts .
COPY index.html .

COPY package-lock.json .
COPY package.json .
COPY vite.config.ts .

COPY tsconfig.app.json .
COPY tsconfig.json .
COPY tsconfig.node.json .

COPY __tests__/ ./__tests__
COPY tsconfig.vitest.json .
COPY vitest.config.ts .

FROM source AS dev
RUN npm i

EXPOSE 4173

ENTRYPOINT ["/usr/local/bin/npm", "run", "dev"]


FROM source AS prod
RUN npm i
RUN npm run build

EXPOSE 4173

ENTRYPOINT ["/usr/local/bin/npm", "run", "preview"]
