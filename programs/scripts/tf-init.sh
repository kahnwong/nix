#!/bin/bash

terraform state replace-provider -auto-approve registry.terraform.io/-/aws hashicorp/aws && terraform init
