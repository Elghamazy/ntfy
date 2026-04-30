# ---- Build stage ----
FROM golang:1.22-alpine AS builder

WORKDIR /app

RUN apk add --no-cache git

# Build ntfy (correct path)
RUN go install github.com/binwiederhier/ntfy@latest

# ---- Runtime stage ----
FROM alpine:3.19

WORKDIR /app

# Copy binary
COPY --from=builder /go/bin/ntfy /usr/local/bin/ntfy

# Create dirs
RUN mkdir -p /etc/ntfy /var/cache/ntfy

EXPOSE 8000

CMD ["ntfy", "serve"]
