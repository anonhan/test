#!/bin/bash

VERSION=${1#v}  # Remove 'v' prefix if present

if [ -z "$VERSION" ]; then
    echo "Please provide a version number."
    exit 1
fi

git checkout develop
git pull origin develop
git checkout -b release/$VERSION

# Run tests and make changes here
echo "Running tests for release version v$VERSION..."
python main.py

if [ $? -eq 0 ]; then
    echo "Tests passed for version v$VERSION."
else
    echo "Tests failed. Exiting release process."
    exit 1
fi

echo "Release branch release/v$VERSION created and tests run. Now, finalize the release."
