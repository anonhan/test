#!/bin/bash

VERSION=$1

if [ -z "$VERSION" ]; then
    echo "Please provide a version number."
    exit 1
fi

git checkout main
git merge release/$VERSION
git checkout develop
git merge release/$VERSION
git tag -a v$VERSION -m "Release version $VERSION"
git push origin main develop
git push origin v$VERSION

echo "Release $VERSION created and pushed."
