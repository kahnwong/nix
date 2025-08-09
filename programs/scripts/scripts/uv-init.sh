#!/bin/bash

uv python pin 3.13
uv init --author-from git
uv venv

cat <<EOF >>pyproject.toml
[tool.hatch.build.targets.wheel]
packages = ["src"]

[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"
EOF
uv pip install -e .

rm hello.py
