#!/usr/bin/env bash

readonly CWD=`cd $(dirname ${0}) && pwd`

# Remove pages, posts and menus
docker exec api wp post delete $(docker exec api wp post list --post_type=page,post --format=ids)
docker exec api wp menu delete $(docker exec api wp menu list --format=ids)

# Prepare contents
docker cp $CWD/sample-content.txt api:/var/www/html/wordpress

# Add pages
docker exec api wp post create ./sample-content.txt --post_type=page --post_title='Home Page' --post_name=home --post_status=publish
docker exec api wp post create ./sample-content.txt --post_type=page --post_title='Test Page' --post_name=test-page --post_status=publish

# Add posts
docker exec api wp post create ./sample-content.txt --post_type=post --post_title='Happy New Year!' --post_name=happy-new-year --post_status=publish
docker exec api wp post create ./sample-content.txt --post_type=post --post_title="10 World Secrets You'll Never Know the Truth About" --post_name=10-world-secrets --post_status=publish

# Add menus
docker exec api wp menu create "Main menu"
docker exec api wp menu create "Footer menu"

# Show pages, posts and menus
docker exec api wp post list --post_type=page,post --fields=ID,post_type,post_title,post_name,post_date,post_status --orderby=post_type
docker exec api wp menu list
