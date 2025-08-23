#!/bin/bash

uv python pin 3.13
uv init --author-from git --no-description
uv venv

# -- seems like we no longer need these in 2025-08
#cat <<EOF >>pyproject.toml
#[tool.hatch.build.targets.wheel]
#packages = ["src"]
#
#[build-system]
#requires = ["hatchling"]
#build-backend = "hatchling.build"
#EOF
#uv pip install -e .

rm main.py
