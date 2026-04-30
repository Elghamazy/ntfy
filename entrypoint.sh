#!/bin/sh
PORT="${PORT:-8080}"
sed -i "s|listen-http:.*|listen-http: \":${PORT}\"|" /etc/ntfy/server.yml

# Create admin user on every startup (safe to run repeatedly — ntfy skips if user exists)
printf '%s\n%s\n' "${NTFY_PASS}" "${NTFY_PASS}" | ntfy user add --config /etc/ntfy/server.yml --role=admin "${NTFY_USER}" 2>/dev/null || true

exec ntfy serve --config /etc/ntfy/server.yml