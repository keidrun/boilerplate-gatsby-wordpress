#!/usr/bin/env bash

readonly WP_URL=http://api:8080
readonly WP_TITLE="WordPress Headless API"
readonly WP_ADMIN_USER=wordpress
readonly WP_ADMIN_PASS=wordpress
readonly WP_ADMIN_EMAIL=info@example.com
readonly WP_PERMALINK='/%postname%/'
readonly WP_PLUGINS=(
  classic-editor
  health-check
  wp-api-menus
  jwt-authentication-for-wp-rest-api
  advanced-custom-fields
  acf-to-rest-api
)

# Install Wordpress Core
docker exec api wp core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASS" --admin_email="$WP_ADMIN_EMAIL"

# Change Permalinks
docker exec api wp rewrite structure "$WP_PERMALINK"

# Install Plugins
docker exec api wp plugin update --all
for plugin in ${WP_PLUGINS[@]}; do
  docker exec api wp plugin install $plugin --activate
done
