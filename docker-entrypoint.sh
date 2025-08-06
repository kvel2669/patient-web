#!/bin/sh
# If API_URL is provided, substitute in index.template.html → index.html
if [ -n "$API_URL" ]; then
  envsubst '${API_URL}' < /usr/share/nginx/html/index.template.html \
    > /usr/share/nginx/html/index.html
else
  # Fallback: just copy the template
  cp /usr/share/nginx/html/index.template.html \
     /usr/share/nginx/html/index.html
fi

exec "$@"