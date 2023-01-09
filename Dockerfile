FROM caddy:2.6.2-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/gamalan/caddy-tlsredis \
    --with github.com/baldinof/caddy-supervisor

FROM caddy:2.6.2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

RUN apk add --no-cache \
    python3 \
    py3-pip

RUN pip install redis sentry-sdk
