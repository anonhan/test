# release.ps1

# Create a release branch
$version = Get-Content VERSION.txt
git checkout -b "release/$version"
git push origin "release/$version"

# Run tests
pytest
