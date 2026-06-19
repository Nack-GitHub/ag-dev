#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# ANSI colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Installing Antigravity Kit (ag-dev) ===${NC}"

# Check for Node.js and npm
if ! command -v node >/dev/null 2>&1; then
    echo -e "${RED}Error: Node.js is required but not installed.${NC}" >&2
    exit 1
fi

if ! command -v npm >/dev/null 2>&1; then
    echo -e "${RED}Error: npm is required but not installed.${NC}" >&2
    exit 1
fi

# Detect if we are running inside the repository directory
if [ -d "cli" ] && [ -f "cli/package.json" ]; then
    echo -e "${BLUE}Detected local repository. Installing from current directory...${NC}"
    cd cli
    npm install
    npm install -g .
else
    # Check for git
    if ! command -v git >/dev/null 2>&1; then
        echo -e "${RED}Error: git is required to install remotely.${NC}" >&2
        exit 1
    fi
    
    TEMP_DIR=$(mktemp -d -t ag-dev-install-XXXXXX)
    echo -e "${BLUE}Cloning repository to a temporary directory...${NC}"
    git clone --depth 1 https://github.com/Nack-GitHub/ag-dev.git "$TEMP_DIR"
    
    cd "$TEMP_DIR/cli"
    echo -e "${BLUE}Installing dependencies...${NC}"
    npm install
    
    echo -e "${BLUE}Installing ag-kit globally...${NC}"
    npm install -g .
    
    # Cleanup
    rm -rf "$TEMP_DIR"
fi

echo -e "${GREEN}✓ ag-kit (ag-dev) installed successfully!${NC}"
echo -e "You can now run ${BLUE}ag-kit init${NC} in any project root to initialize."
