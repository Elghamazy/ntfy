FROM binwiederhier/ntfy:latest

COPY server.yml /etc/ntfy/server.yml
COPY entrypoint.sh /entrypoint.sh

RUN mkdir -p /var/lib/ntfy /var/lib/ntfy/attachments \
    && chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]