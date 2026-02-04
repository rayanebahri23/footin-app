#!/bin/bash
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

# Get Dependencies
echo "📦 Installing Dependencies..."
flutter pub get

# Build
echo "🚀 Building for Web (HTML Renderer)..."
flutter build web --release --web-renderer html --no-tree-shake-icons

# Force Overwrite index.html with manual version (Critical Fix)
echo "🛡️ Forcing use of manual index.html..."
cp web/index.html build/web/index.html
