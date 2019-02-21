#!/usr/bin/env bash

readonly CWD=`cd $(dirname ${0}) && pwd`
rm -r $CWD/../wp-api/wp-content
rm -r $CWD/../mysql/data
