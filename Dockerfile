FROM alpine:3

RUN apk add -U --no-cache curl httpie

USER 1000
