#!/bin/sh

set -e

echo "ENV at entrypoint:"
env

APP_ENV=${APP_ENV:-staging}
APP_TAG=${APP_BUILD_TAG:-latest}
APP_FULL_ENV=$(env)
APP_FULL_ENV_PRE="<pre>${APP_FULL_ENV}</pre>"

NGINX_INSTALL_PATH=/etc/nginx

for html in $SRV_DIR/*.html; do
  sed -i "s/PLACEHOLDER_APP_ENV/${APP_ENV}/g" "${html}"
  sed -i "s/PLACEHOLDER_APP_TAG/${APP_TAG}/g" "${html}"
done

echo "${APP_FULL_ENV_PRE}" > $SRV_DIR/env.html

exec "$@"
