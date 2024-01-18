FROM node:21.5.0-alpine3.19 AS build

COPY . /app/

WORKDIR /app

RUN npm ci

FROM node:21.5.0-alpine3.19 AS express

LABEL org.opencontainers.image.source https://github.com/alexispet/final-test-AlexandreDAUSSIN.git

WORKDIR /app

COPY --from=build /app .

# On expose le port
EXPOSE 3000

# On copie le script
COPY docker/express/docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]
CMD ["npm", "run", "start"]