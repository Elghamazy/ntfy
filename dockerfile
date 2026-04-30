# ---- Build stage ----
FROM golang:1.22-alpine AS builder

WORKDIR /app

# Install git (needed for go install)
RUN apk add --no-cache git

# Download and build ntfy
RUN go install github.com/binwiederhier/ntfy/cmd/ntfy@latest

# ---- Runtime stage ----
FROM alpine:3.19

WORKDIR /app

# Copy binary from builder
COPY --from=builder /go/bin/ntfy /usr/local/bin/ntfy

# Create config + data dirs
RUN mkdir -p /etc/ntfy /var/lib/ntfy

# Expose default port
EXPOSE 8000

# Default command
CMD ["ntfy", "serve"]
