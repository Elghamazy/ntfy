FROM binocs/ntfy:latest

COPY server.yml /etc/ntfy/server.yml

VOLUME ["/var/lib/ntfy"]

# Koyeb injects PORT at runtime — ntfy reads it via shell expansion in CMD
EXPOSE 8080

ENTRYPOINT ["ntfy"]
CMD ["serve", "--config", "/etc/ntfy/server.yml"]
