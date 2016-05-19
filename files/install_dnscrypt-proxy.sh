#!/bin/bash
set -e

function download_and_compile() {
    SOURCE_URL="$1"
    #ARCHIVE_DIR="$(echo "$ARCHIVE_NAME" | sed -e 's/\.\(tar\.gz\|tgz\|tar.bz2\)$//')"
    ARCHIVE_DIR="$(basename "$1" .tar.gz)"

    cd /usr/src

    if [[ ! -d "${ARCHIVE_DIR}" ]]; then
        curl "${SOURCE_URL}" | tar zx
    fi

    cd "${ARCHIVE_DIR}"

    ./configure --prefix=/usr
    make
    make install
}

download_and_compile https://download.libsodium.org/libsodium/releases/libsodium-1.0.3.tar.gz
download_and_compile https://download.dnscrypt.org/dnscrypt-proxy/dnscrypt-proxy-1.6.0.tar.gz
