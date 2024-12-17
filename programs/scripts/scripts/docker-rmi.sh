#!/bin/bash

# shellcheck disable=SC2154
docker images | grep "$1" | awk '{print $3}' | xargs docker rmi
