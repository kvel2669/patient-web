# Stage 1: Builder (for envsubst, optional)
FROM alpine:latest AS builder
RUN apk add --no-cache gettext

WORKDIR /app
COPY index.html ./index.template.html

# Stage 2: Runtime
FROM nginx:alpine

# Copy custom Nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy static assets
#COPY assets/ /usr/share/nginx/html/assets/

# Copy and process index.html using envsubst if $API_URL is set
COPY --from=builder /app/index.template.html /usr/share/nginx/html/index.template.html
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]