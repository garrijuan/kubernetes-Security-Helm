#!/bin/bash

set -e

# Package the Helm chart
helm package ./EoloPlanner -d ./EoloPlanner/charts

# Create or update the Helm repository index
helm repo index ./EoloPlanner/charts #--url helm repo add httpd-web-server https://raw.githubusercontent.com/garrijuan/kubernetes-Security-Helm/main/EoloPlanner/charts/

# Add the Helm repository
helm repo add httpd-web-server helm repo add httpd-web-server https://raw.githubusercontent.com/garrijuan/kubernetes-Security-Helm/main/EoloPlanner/charts/

# Commit and push changes to Git
git add .
git commit -m "New version"
git push

# Update Helm repositories
helm repo update

# Install the Helm chart
helm install eoloplanner httpd-web-server/EoloPlanner
