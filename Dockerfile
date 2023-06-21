FROM caddy:2.6.4-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/gamalan/caddy-tlsredis

FROM caddy:2.6.4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

RUN apk add --no-cache \
    python3 \
    py3-pip

RUN pip install redis sentry-sdk supervisor
