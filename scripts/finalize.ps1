param([string]$version)

if (-not $version) {
    Write-Host "Please provide a version number."
    exit 1
}

# Merge release branch into main
git checkout main
git merge "release/$version"

# Merge release branch into develop
git checkout develop
git merge "release/$version"

# Create a Git tag and push to the repository
git tag -a "v$version" -m "Release version $version"
git push origin main develop
git push origin "v$version"

Write-Host "Release $version created and pushed."
