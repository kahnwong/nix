#!/bin/bash

brew install batt
sudo brew services start batt

echo "Checking status... (sudo batt status)"
sudo batt status
