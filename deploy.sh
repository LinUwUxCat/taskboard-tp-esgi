#!/bin/bash

set -e

APP_DIR=/opt/my-api

echo "===> Déploiement"

if [ ! -d "$APP_DIR" ]; then
    git clone https://github.com/USER/REPO.git "$APP_DIR"
fi

cd "$APP_DIR"

git pull

docker compose pull

docker compose up -d --build

echo "===> Healthcheck"

sleep 5

curl -f http://localhost:3000/health

echo "===> Déploiement réussi"