#!/bin/sh
set -eu

secret="${SEARXNG_SECRET:-}"
if [ -z "$secret" ]; then
  secret="$(python -c 'import secrets; print(secrets.token_urlsafe(48))')"
fi
sed "s|__SEARXNG_SECRET__|$secret|g" /tmp/searxng-settings.yml.template > /etc/searxng/settings.yml

exec /usr/local/searxng/entrypoint.sh
