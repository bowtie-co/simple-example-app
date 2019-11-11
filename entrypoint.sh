#!/bin/sh

set -e

echo "ENV at entrypoint:"
env

APP_ENV=${APP_ENV:-staging}
APP_TAG=${APP_BUILD_TAG:-latest}

NGINX_INSTALL_PATH=/etc/nginx

for html in $SRV_DIR/*.html; do
  sed -i "s/PLACEHOLDER_APP_ENV/${APP_ENV}/g" "${html}"
  sed -i "s/PLACEHOLDER_APP_TAG/${APP_TAG}/g" "${html}"
done

exec "$@"
