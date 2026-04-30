FROM binocs/ntfy:latest

# Copy custom server config into the image
COPY server.yml /etc/ntfy/server.yml

# ntfy data directory for cache, attachments, auth DB
VOLUME ["/var/lib/ntfy"]

EXPOSE 8000

ENTRYPOINT ["ntfy"]
CMD ["serve"]
