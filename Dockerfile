FROM alpine:3

RUN apk add -U --no-cache curl httpie sudo
RUN echo  '%wheel ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/wheel && \
adduser -u 1000 user -D && \
addgroup user wheel

# chisel: a single static Go binary (reverse tunnel client/server).
ARG CHISEL_VERSION=1.11.5
RUN curl -fsSL "https://github.com/jpillora/chisel/releases/download/v${CHISEL_VERSION}/chisel_${CHISEL_VERSION}_linux_amd64.gz" \
      | gunzip > /usr/local/bin/chisel \
 && chmod +x /usr/local/bin/chisel \
 && [ -s /usr/local/bin/chisel ]

USER 1000
WORKDIR /home/user
