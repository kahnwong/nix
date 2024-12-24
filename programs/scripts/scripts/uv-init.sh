#!/bin/bash

uv python pin 3.13
uv init
uv venv

cat <<EOF >>pyproject.toml

[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"
EOF
uv pip install -e .

rm hello.py
