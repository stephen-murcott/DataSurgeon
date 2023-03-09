#!/bin/bash
if [ -d "DataSurgeon" ]; then
    echo "[*] Removing old 'DataSurgeon' directory"
    rm -rf DataSurgeon 2>&1
fi
if [ -f "/usr/local/bin/ds" ]; then
    echo "[*] Removing old executable (password required)"
    sudo rm -rf /usr/local/bin/ds 2>&1
fi
git clone https://github.com/Drew-Alleman/DataSurgeon
cd DataSurgeon
cargo build --release
if [ -f "target/release/ds" ]; then
    echo "[*] Removing old executable (password required)"
    chmod +x target/release/ds
    sudo mv target/release/ds /usr/local/bin/ds
    cd ..
    rm -rf DataSurgeon 2>&1
    exit
fi
