#!/bin/bash

cp ~/.sops-dc.yaml .sops.yaml
chmod 644 .sops.yaml
git add .sops.yaml
