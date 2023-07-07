FROM cgr.dev/chainguard/wolfi-base:latest

RUN apk update && apk upgrade --no-cache

RUN apk add git curl openssh rsync

RUN apk add php nodejs

WORKDIR /srv