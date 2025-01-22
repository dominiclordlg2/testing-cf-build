# !/bin/bash

yarn generate --fail-on-error

ZIP_NAME="dist-${CF_PAGES_COMMIT_SHA}.zip"
echo $ZIP_NAME
tar -czf "$ZIP_NAME" dist/
mv "$ZIP_NAME" dist/
