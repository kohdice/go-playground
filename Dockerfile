FROM golang:1.23-alpine AS builder

RUN apk update && apk upgrade \
  && apk --update add --no-cache git make bash

WORKDIR /app

COPY . .

RUN make build

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app /app

CMD ["/app/go-playground"]
