#!/usr/bin/env bash

# Install Wordpress Core
docker exec api wp core install --url=http://localhost:8080 --title='WordPress Headless API' --admin_user=wordpress --admin_password=wordpress --admin_email=info@example.com

# Change Permalinks
docker exec api wp rewrite structure '/%postname%/'

# Install Plugins
docker exec api wp plugin update --all
docker exec api wp plugin install classic-editor --activate
docker exec api wp plugin install health-check --activate
docker exec api wp plugin install wp-api-menus --activate
docker exec api wp plugin install jwt-authentication-for-wp-rest-api --activate
