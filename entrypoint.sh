#!/bin/sh
PORT="${PORT:-8080}"
sed -i "s|listen-http:.*|listen-http: \":${PORT}\"|" /etc/ntfy/server.yml

# Create admin user non-interactively via env var, skip if already exists
NTFY_PASSWORD="${NTFY_PASS}" ntfy user add --role=admin --ignore-exists "${NTFY_USER}"

exec ntfy serve --config /etc/ntfy/server.yml