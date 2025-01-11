#!/bin/bash

# Nama pengguna GitHub
GITHUB_USERNAME="abiyamakruf"

# Nama image
IMAGE_NAME="karsajobs-ui"
IMAGE_TAG="latest"

# URL GitHub Container Registry
REGISTRY="ghcr.io"

# Nama package
GITHUB_IMAGE="$REGISTRY/$GITHUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG"

# Build Docker image
echo "Building Docker image for karsajobs-ui..."
docker build -t $GITHUB_IMAGE .

# Login ke GitHub Container Registry
echo "Logging in to GitHub Container Registry..."
echo $PAT | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Push Docker image ke GitHub Container Registry
echo "Pushing Docker image to GitHub Packages..."
docker push $GITHUB_IMAGE

echo "Docker image pushed successfully to GitHub Packages!"
