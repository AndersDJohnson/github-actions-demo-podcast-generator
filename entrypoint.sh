#!/bin/bash

echo "==================="

echo "Configuring git..."

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory "$GITHUB_WORKSPACE"

echo "...configured git!"

echo "Running python script for feed..."

python3 /usr/bin/feed.py

echo "...ran python script for feed!"

echo "Staging to git..."

git add -A

echo "...staged to git!"

echo "Committing to git..."

git commit -m "Update Feed"

echo "...committed to git!"

echo "Pushing to git..."

git push --set-upstream origin main

echo "...pushed to git!"

echo "==================="
