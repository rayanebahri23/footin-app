#!/bin/bash
set -e # Critical: Stop script if any command fails (e.g., flutter build)

echo "🚧 Starting Custom Flutter Build for Vercel..."

# Install Flutter if not present
if [ -d "flutter" ]; then
    echo "✅ Flutter already installed."
else
    echo "⬇️ Cloning Flutter SDK..."
    git clone https://github.com/flutter/flutter.git -b stable --depth 1
fi

# Add local Flutter to PATH
export PATH="$PATH:$(pwd)/flutter/bin"

# Disable Analytics (Prevents "Welcome to Flutter" interactive hang)
echo "🔇 Disabling Analytics..."
flutter config --no-analytics

# Enable Web
echo "🌍 Enabling Web..."
flutter config --enable-web

# Initialize Web Platform (Generates missing structure like icons)
echo "🔧 Initializing Web Platform..."
flutter create . --platforms web

# Get Dependencies
echo "📦 Installing Dependencies..."
flutter pub get

# Build
echo "🚀 Building for Web..."
flutter build web --release

# Force Overwrite index.html with manual version (Critical Fix)
echo "🛡️ Forcing use of manual index.html..."
mkdir -p build/web # Ensure directory exists
cp web/index.html build/web/index.html

# DEBUG: Verify output
echo "📂 Listing build directory:"
ls -R build/web
echo "📄 Content of generated index.html:"
cat build/web/index.html

echo "✅ Build Complete!"
