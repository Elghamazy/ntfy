#!/bin/sh
PORT="${PORT:-8080}"
sed -i "s|listen-http:.*|listen-http: \":${PORT}\"|" /etc/ntfy/server.yml

# Start ntfy in the background so it can create the auth DB
ntfy serve --config /etc/ntfy/server.yml &
NTFY_PID=$!

# Wait for the auth DB to be created
until [ -f /var/lib/ntfy/auth.db ]; do
  sleep 1
done

# Create admin user (skips if already exists)
NTFY_PASSWORD="${NTFY_PASS}" ntfy user add --role=admin --ignore-exists "${NTFY_USER}"

# Hand control back to ntfy
wait $NTFY_PID