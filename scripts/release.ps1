# release.ps1

# Ensure the script is run from the project root
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Path)

# Read the version number from VERSION.txt
$version = Get-Content VERSION.txt

# Create a release branch
git checkout develop
git pull origin develop
git checkout -b "release/v$version"

# Run tests
python -m unittest discover

# Push the release branch to the remote repository
git push origin "release/v$version"
