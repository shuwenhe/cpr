#!/bin/bash

set -e

# 🏁 Step 1: Install system dependencies
echo "🔧 Installing dependencies..."
sudo apt update
sudo apt install -y git cmake build-essential libssl-dev curl

# 📁 Step 2: Clone CPR source
echo "📥 Cloning CPR repository..."
git clone https://github.com/libcpr/cpr.git --depth=1
cd cpr

# 🏗️ Step 3: Build CPR
echo "🛠️ Building CPR..."
mkdir -p build
cd build
cmake .. -DBUILD_CPR_TESTS=OFF -DCMAKE_USE_OPENSSL=ON
make -j$(nproc)

# 📦 Step 4: Install
echo "📦 Installing CPR to system..."
sudo make install

# 🧹 Step 5: Cleanup
echo "🧹 Cleaning up..."
cd ../..
rm -rf cpr

# ✅ Done
echo "✅ CPR installation complete!"

