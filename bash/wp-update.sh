#!/usr/bin/env bash

# Update Core
docker exec api wp core update
docker exec api wp core update-db

# Update Plugins
docker exec api wp plugin update --all

# Update Themes
docker exec api wp theme update --all

# Update Language
docker exec api wp language core update
docker exec api wp language plugin update --all
docker exec api wp language theme update --all
