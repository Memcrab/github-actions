#!/bin/bash
COMMIT_MESSAGE=$(git log -n 1 --pretty=format:%s $GITHUB_SHA)
LEVEL=patch
if [[ $COMMIT_MESSAGE == *"#major"* ]] 
	then LEVEL=major
	else
		if [[ $COMMIT_MESSAGE == *"#minor"* ]] 
			then LEVEL=minor
		fi
fi
echo "Up version as $LEVEL"
VERSION=$(semver -i $LEVEL $(semver-tags --last)) 
echo "Current Version: $VERSION"
git tag -a $VERSION -m "$VERSION" $GITHUB_SHA
echo "{\"version\":\"$VERSION\"}" > ./version.json