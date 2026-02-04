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
export PATH="$PATH:`pwd`/flutter/bin"

# Diagnostics
echo "🔍 Flutter Environment:"
flutter doctor -v

# Enable Web
echo "🌍 Enabling Web..."
flutter config --enable-web

# Get Dependencies
echo "📦 Installing Dependencies..."
flutter pub get

# Build
echo "🚀 Building for Web..."
flutter build web --release --no-tree-shake-icons

echo "✅ Build Complete!"
