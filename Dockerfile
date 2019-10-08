FROM golang:1.11.13-stretch AS go-1.11

FROM golang:1.12.10-stretch AS go-1.12

FROM golang:1.13.1-buster AS go-1.13

FROM golangci/golangci-lint:v1.17.1 AS golangci-lint

FROM alpine:3.10.2

COPY ./build /

RUN /build

COPY --from=go-1.11 /usr/local/go/ /usr/local/go-1.11/

COPY --from=go-1.12 /usr/local/go/ /usr/local/go-1.12/

COPY --from=go-1.13 /usr/local/go/ /usr/local/go-1.13/

COPY --from=golangci-lint /usr/bin/golangci-lint /usr/bin/
