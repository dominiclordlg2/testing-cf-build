# !/bin/bash

# Generate static site
yarn generate --fail-on-error

# Create zip file
ZIP_NAME="dist-${CF_PAGES_COMMIT_SHA}.zip"
tar -czf "$ZIP_NAME" dist/
mv "$ZIP_NAME" dist/

# Upload to R2 using wrangler
npx wrangler r2 object put "${R2_BUCKET_NAME}/${ZIP_NAME}" --file "dist/$ZIP_NAME"