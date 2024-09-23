# finalize.ps1

# Ensure the script is run from the project root
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Path)

# Read the version number from VERSION.txt
$version = Get-Content VERSION.txt

# Merge the release branch into main
git checkout main
git pull origin main
git merge --no-ff "release/v$version"

# Tag the release
git tag -a "v$version" -m "Release version $version"

# Push the changes and tags to the remote repository
git push origin main
git push origin "v$version"

# Merge the release branch back into develop
git checkout develop
git pull origin develop
git merge --no-ff "release/v$version"

# Push the changes to the remote repository
git push origin develop

# Delete the release branch locally and remotely
git branch -d "release/v$version"
git push origin --delete "release/v$version"
