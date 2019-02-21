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
docker exec api wp plugin install advanced-custom-fields --activate
docker exec api wp plugin install acf-to-rest-api --activate

# Set up JWT
docker exec api wp config set JWT_AUTH_SECRET_KEY 'P}XTapir*f$&S@yd%r]+g~YNV6N|+I_Eo[~^9o+RX09e<#,g.cd:D<W#y;kV-~)z'
docker exec api wp config set JWT_AUTH_CORS_ENABLE true --raw
