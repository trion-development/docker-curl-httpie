FROM alpine:3

RUN apk add -U --no-cache curl httpie sudo
RUN echo  '%wheel ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/wheel && \
adduser -u 1000 user -D && \
addgroup user wheel

USER 1000