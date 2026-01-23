# Build stage
FROM squidfunk/mkdocs-material:9.5 AS builder

WORKDIR /docs

# Copy documentation source
COPY mkdocs.yml .
COPY docs/ docs/

# Build static site
RUN mkdocs build

# Production stage - lightweight nginx server
FROM nginx:alpine

# Copy built site to nginx
COPY --from=builder /docs/site /usr/share/nginx/html

# Expose port
EXPOSE 80

# nginx runs by default
