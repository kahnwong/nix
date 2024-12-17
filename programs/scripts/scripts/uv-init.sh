#!/bin/bash

uv python pin 3.12
uv init
uv venv

cat <<EOF >>pyproject.toml

[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"
EOF
uv pip install -e .

rm hello.py
