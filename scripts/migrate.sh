#!/bin/bash

go install github.com/kahnwong/config-init@latest

make apply
make ssh-keys-restore
