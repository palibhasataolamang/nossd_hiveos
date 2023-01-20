#!/bin/bash
set -e

fast_installation() {
mkdir /root/nossd
wget https://github.com/palibhasataolamang/nossd_hiveos/blob/main/nossd/client?raw=true -O /root/nossd/client
wget https://github.com/palibhasataolamang/nossd_hiveos/blob/main/nossd/libarchive.so.13?raw=true -O /root/nossd/libarchive.so.13
wget https://github.com/palibhasataolamang/nossd_hiveos/blob/main/nossd/libcrypto.so.3?raw=true -O /root/nossd/libcrypto.so.3
wget https://github.com/palibhasataolamang/nossd_hiveos/blob/main/nossd/libgmp.so.10?raw=true -O /root/nossd/libgmp.so.10
wget https://github.com/palibhasataolamang/nossd_hiveos/blob/main/nossd/libssl.so.3?raw=true -O /root/nossd/libssl.so.3
wget https://github.com/palibhasataolamang/nossd_hiveos/blob/main/nossd/libstdc++.so.6?raw=true -O /root/nossd/libstdc++.so.6
wget https://github.com/palibhasataolamang/nossd_hiveos/blob/main/nossd/libtorrent-rasterbar.so.2.0?raw=true -O /root/nossd/libtorrent-rasterbar.so.2.0
wget https://github.com/palibhasataolamang/nossd_hiveos/blob/main/nossd/libz.so.1?raw=true -O /root/nossd/libz.so.1
wget https://raw.githubusercontent.com/palibhasataolamang/nossd_hiveos/main/mountall.sh -O /root/nossd/mountall.sh
  chmod +x /root/nossd/client
  chmod +x /root/nossd/mountall.sh
  
}


if [[ "$EUID" -eq 0 ]]; then
  fast_installation
else
  type sudo >/dev/null 2>&1 || { echo "sudo not installed, change into root context" >&2; exit 1; }

  DECL="$(declare -f fast_installation)"
  sudo bash -c "$DECL; fast_installation"
fi
