# !/bin/bash

# Check for zip file in backup directory
if [ -d "backup" ]; then
    ZIP_FILE=$(find backup -maxdepth 1 -name "*.zip" -type f | head -n 1)

    if [ -n "$ZIP_FILE" ]; then
        echo "Found backup zip: $ZIP_FILE"
        TEMP_DIR=$(mktemp -d)
        tar -xf "$ZIP_FILE" -C "$TEMP_DIR"

        if [ ! -d "$TEMP_DIR/dist/_nuxt" ]; then
            echo "Error: Not a valid Nuxt app backup"
            rm -rf "$TEMP_DIR"
            exit 1
        fi

        rm -rf dist
        mv "$TEMP_DIR/dist" .
        rm -rf "$TEMP_DIR"
        echo "Backup restored successfully"
        report_status "success"
        exit 0
    fi
fi

# Generate static site
yarn generate --fail-on-error

# Create zip file
ZIP_NAME="dist_$(date +%Y%m%d%H%M%S)_${CF_PAGES_COMMIT_SHA:0:8}.zip"
tar -czf "$ZIP_NAME" dist/

# Upload to R2 using wrangler
npx wrangler r2 object put "${R2_BUCKET_NAME}/${ZIP_NAME}" --file "$ZIP_NAME"