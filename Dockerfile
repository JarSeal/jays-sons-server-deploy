FROM alpine:3.14

WORKDIR /jsondata

COPY db.json db.json

RUN apk update && \
    apk add --update nodejs npm && \
    npm install -g json-server && \
    apk del npm && \
    adduser -D appuser

USER appuser

CMD json-server --port $PORT --host 0.0.0.0 --watch true db.json