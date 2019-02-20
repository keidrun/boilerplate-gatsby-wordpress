#!/usr/bin/env bash

readonly CWD=`cd $(dirname ${0}) && pwd`

zip -rj $CWD/disable-frontend-theme.zip $CWD/disable-frontend-theme
docker cp $CWD/disable-frontend-theme.zip api:/var/www/html/wordpress
docker exec api wp theme install ./disable-frontend-theme.zip --activate
rm $CWD/disable-frontend-theme.zip
