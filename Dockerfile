FROM golang:1.16.5-alpine3.14 as builder

LABEL maintainer="cncf-falco-dev@lists.cncf.io"

RUN apk add --no-cache make bash git build-base

WORKDIR /event-generator
COPY . .

FROM alpine:3.14


# Need to have this for helper.RunShell
RUN apk add bash

# Need to have this for syscall.WriteBelowRpmDatabase
RUN mkdir -p /var/lib/rpm/

ENTRYPOINT ["/bin/event-generator"]
