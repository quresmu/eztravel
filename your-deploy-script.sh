#!/bin/bash

# Exit on error
set -e

# Function to check if a command exists
command_exists() {
    command -v "$1" &> /dev/null
}

# Install Yarn if not already installed
if ! command_exists yarn; then
    echo "Yarn is not installed. Installing Yarn..."
    if command_exists npm; then
        npm install -g yarn
        echo "Yarn installed successfully!"
    else
        echo "Error: npm is not installed. Please install Node.js and npm first."
        exit 1
    fi
else
    echo "Yarn is already installed. Skipping Yarn installation."
fi

# Initialize a package.json if it doesn't exist
if [ ! -f "package.json" ]; then
    echo "No package.json found. Initializing a new project..."
    yarn init -y
    echo "package.json created."
fi

# Install @datadog/datadog-ci as a dev dependency
echo "Installing @datadog/datadog-ci as a development dependency..."
yarn add --dev @datadog/datadog-ci

echo "Installation complete. @datadog/datadog-ci is ready to use!"
