#!/bin/bash

# <https://github.com/sourcegit-scm/sourcegit>

curl https://codeberg.org/api/packages/yataro/debian/repository.key | sudo tee /etc/apt/keyrings/sourcegit.asc
echo "deb [signed-by=/etc/apt/keyrings/sourcegit.asc] https://codeberg.org/api/packages/yataro/debian generic main" | sudo tee /etc/apt/sources.list.d/sourcegit.list
sudo apt update
sudo apt install sourcegit
