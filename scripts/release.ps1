# release.ps1
# Ensure script stops on any errors
$ErrorActionPreference = "Stop"

# Check if the working directory is clean
$gitStatus = git status --porcelain
if ($gitStatus -ne "") {
    Write-Host "Working directory is not clean. Commit or stash your changes first."
    exit 1
}

# Get the version number from VERSION.txt
$version = Get-Content VERSION.txt

# Create a new release branch
git checkout develop
git pull origin develop
git checkout -b "release/v$version"

# Run tests (assuming you have tests set up)
Write-Host "Running tests..."
# Add your test commands here, e.g., pytest

# Push the release branch to the remote repository
git push -u origin "release/v$version"
