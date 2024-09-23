# finalize.ps1

# Exit immediately if a command exits with a non-zero status.
$ErrorActionPreference = "Stop"

# Get the version number from the first argument
$version = $args[0]

if (-not $version) {
    Write-Host "Please provide a version number."
    exit 1
}

# Check if the tag already exists
if (git show-ref --tags | Select-String "v$version") {
    Write-Host "Tag v$version already exists. Exiting."
    exit 1
}

# Merge the release branch into main
git checkout main
git pull origin main
git merge --no-ff "release/$version"

# Tag the release
git tag -a "v$version" -m "Release version $version"

# Push the changes and tags to the remote repository
git push origin main
git push origin "v$version"

# Merge the release branch back into develop
git checkout develop
git pull origin develop
git merge --no-ff "release/$version"

# Push the changes to the remote repository
git push origin develop

# Delete the release branch locally and remotely
try {
    git branch -d "release/$version"
} catch {
    Write-Host "Release branch not fully merged. Forcing deletion."
    git branch -D "release/$version"
}
git push origin --delete "release/$version"
