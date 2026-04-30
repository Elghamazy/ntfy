#!/bin/sh
# Substitute $PORT into the ntfy listen address at runtime
PORT="${PORT:-8080}"
sed -i "s|listen-http:.*|listen-http: \":${PORT}\"|" /etc/ntfy/server.yml
exec ntfy serve --config /etc/ntfy/server.yml