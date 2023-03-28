#!/bin/bash
swift build -c release
echo "export PATH=\"\$PATH:$(pwd)/.build/release\"" >> ~/.bash_profile
source ~/.bash_profile

