#!/bin/bash

# Flutter web build
echo "Building Flutter web app..."
flutter build web

# Create .well-known directory
echo "Creating .well-known directory..."
mkdir -p build/web/.well-known

# Create apple-app-site-association
echo "Creating apple-app-site-association..."
cat > build/web/.well-known/apple-app-site-association << EOL
{
  "applinks": {
    "apps": [],
    "details": [
      {
        "appID": "TEAM_ID.co.tabiki.app",
        "paths": ["/producer/*"]
      }
    ]
  }
}
EOL

# Create assetlinks.json
echo "Creating assetlinks.json..."
cat > build/web/.well-known/assetlinks.json << EOL
[{
  "relation": ["delegate_permission/common.handle_all_urls"],
  "target": {
    "namespace": "android_app",
    "package_name": "co.tabiki.app",
    "sha256_cert_fingerprints": ["E7:07:64:25:26:D5:9A:E2:69:31:EF:FA:EC:A7:BE:D2:7D:8E:7F:EB:77:CA:A5:DC:F8:40:AC:F5:01:40:EE:D5"]
  }
}]
EOL

# Deploy to Firebase
echo "Deploying to Firebase..."
firebase deploy --only hosting

echo "Deployment completed!" 