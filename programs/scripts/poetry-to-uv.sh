#!/bin/bash

poetry export -o requirements.txt --without-hashes
rm pyproject.toml
rm poetry.lock

uv init
uv venv
uv pip install -r requirements.txt

cat <<EOF >>pyproject.toml

[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"
EOF
uv pip install -e .
