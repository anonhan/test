# create_release.ps1

# Exit immediately if a command exits with a non-zero status.
$ErrorActionPreference = "Stop"

# Get the version number from the first argument and remove 'v' prefix if present
$version = $args[0] -replace '^v', ''

if (-not $version) {
    Write-Host "Please provide a version number."
    exit 1
}

# Checkout develop branch and pull the latest changes
git checkout develop
git pull origin develop

# Create a new release branch
git checkout -b "release/$version"

# Run tests
Write-Host "Running tests for release version v$version..."
pytest

if ($LASTEXITCODE -eq 0) {
    Write-Host "Tests passed for version v$version."
} else {
    Write-Host "Tests failed. Exiting release process."
    exit 1
}

Write-Host "Release branch release/v$version created and tests run. Now, finalize the release."
