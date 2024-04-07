FROM node:alpine

LABEL org.opencontainers.image.source https://github.com/andrewfromtver/cbr_api

WORKDIR /usr/src/app

RUN apk add --no-cache curl yq
RUN npm install express express-rate-limit shell-quote

COPY ./src .

RUN adduser -D apiuser
RUN chown -R apiuser:apiuser /usr/src/app

USER apiuser

EXPOSE 80

CMD ["node", "app.js"]
