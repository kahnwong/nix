#!/bin/bash

cp ~/.pre-commit-config.yaml .
chmod 644 .pre-commit-config.yaml

git init
git add .pre-commit-config.yaml
