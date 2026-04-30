FROM binwiederhier/ntfy:latest

COPY server.yml /etc/ntfy/server.yml

# Create the data directory so ntfy doesn't fatal on startup
RUN mkdir -p /var/lib/ntfy /var/lib/ntfy/attachments

EXPOSE 8080

ENTRYPOINT ["ntfy"]
CMD ["serve", "--config", "/etc/ntfy/server.yml"]
