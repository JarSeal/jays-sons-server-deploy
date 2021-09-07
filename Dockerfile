FROM alpine:3.14

WORKDIR /jsondata
EXPOSE 8080

RUN apk update
RUN apk add --update nodejs npm
RUN npm install -g json-server

COPY db.json db.json

CMD ["json-server", "--port", "8080", "--host", "0.0.0.0", "--watch", "true", "db.json"]