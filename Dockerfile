FROM alpine:3.14

WORKDIR /jsondata

RUN apk update
RUN apk add --update nodejs npm
RUN npm install -g json-server

COPY db.json db.json

CMD ["json-server"]