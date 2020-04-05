#!/bin/bash
set -e

BUILD=b.$GITHUB_RUN_ID
echo "Set build to $BUILD"
git tag -a $BUILD -m "$BUILD" $GITHUB_SHA
echo "{\"version\":\"$BUILD\"}" > ./version.json