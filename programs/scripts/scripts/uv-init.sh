#!/bin/bash

uv python pin 3.13
uv init --package --author-from git --no-description
uv venv

cat <<EOT >>pyproject.toml
# [tool.uv.build-backend]
# module-root = "api"

# [tool.uv]
# package = false
EOT
