FROM caddy:2-builder AS builder

RUN xcaddy build \
    --with github.com/WeidiDeng/caddy-cloudflare-ip \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/hslatman/caddy-crowdsec-bouncer/crowdsec

FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy