FROM golang:1.13.1-buster AS go-1.13

FROM golangci/golangci-lint:v1.20.0 AS golangci-lint

FROM ubuntu:16.04

COPY ./build /

RUN /build

COPY --from=go-1.13 /usr/local/go/ /usr/local/go-1.13/

COPY --from=golangci-lint /usr/bin/golangci-lint /usr/bin/
