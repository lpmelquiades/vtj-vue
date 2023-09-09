FROM 20.6.0-bullseye-slim AS source

WORKDIR /var/www

COPY public/ ./public
COPY src/ ./src

COPY env.d.ts
COPY index.html .

COPY package-lock.json .
COPY package.json .
COPY vite.config.ts .

COPY tsconfig.app.json .
COPY tsconfig.json .
COPY tsconfig.node.json .


FROM source AS dev
RUN npm ci

COPY __tests__/ ./__tests__
COPY tsconfig.vitest.json .
COPY vitest.config.ts .

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/npm", "run", "dev"]


FROM source AS prod
RUN npm ci --only=production
RUN npm run build

ADD https://github.com/Yelp/dumb-init/releases/download/v1.1.1/dumb-init_1.1.1_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

EXPOSE 8080
