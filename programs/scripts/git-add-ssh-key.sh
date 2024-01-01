#!/bin/bash

ssh-add --apple-use-keychain ~/.ssh/github_signing_key
ssh-add --apple-use-keychain ~/.ssh/forgejo_signing_key
