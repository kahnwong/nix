#!/bin/bash

cp ~/.sops-work.yaml .sops.yaml
chmod 644 .sops.yaml
git add .sops.yaml
