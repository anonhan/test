# release.ps1

# Merge release branch into main
git checkout main
git pull origin main
$version = Get-Content VERSION.txt
git merge --no-ff "release/$version"

# Tag the release
git tag -a "v$version" -m "Release version $version"
git push origin main
git push origin "v$version"

# Merge the release branch back into develop
git checkout develop
git pull origin develop
git merge --no-ff "release/$version"
git push origin develop

# Delete the release branch
git branch -d "release/$version"
git push origin --delete "release/$version"
