#!/bin/zsh
swift build -c release
echo "export PATH=\"\$PATH:$(pwd)/.build/release\"" >> ~/.zshrc
source ~/.zshrc
