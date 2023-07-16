FROM golang:1.20-alpine AS builder

RUN apk update && apk upgrade \
    && apk --update add git make bash

WORKDIR /app

COPY . .

RUN make build

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/playground /app

CMD ["/app/playground"]
