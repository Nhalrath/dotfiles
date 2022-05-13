#!/bin/bash

# VeDe - Verify and Decompress backup archives.

FILE_TOTAL=0
FILE_CLEAN=0
FILE_DECOMPRESSED=0

echo "Starting backup importer..."
echo "============================"

for f in $(ls | grep .tar | grep -v .checksum); do
    echo "verifying ${f}..."
    FILE_TOTAL=$((FILE_TOTAL + 1))

    CHKSUM_FILE=$(openssl sha256 ${f})
    CHKSUM_CMP=$(cat ${f}.checksum)

    echo "checksum of ${f}:             ${CHKSUM_FILE}"
    echo "checksum from ${f}.checksum:  ${CHKSUM_CMP}"

    if [ "${CHKSUM_FILE}" == "${CHKSUM_CMP}" ]; then
        echo "${f} is clean!"
        FILE_CLEAN=$((FILE_CLEAN + 1))

        # Decompress file to folder of the same name.
        echo "decompressing ${f}..."
        tar -xf $f --one-top-level=$(echo $f | awk -F '.tar' '{ print $1 }') && \
        echo "${f}: successfully decompressed!" && \
        FILE_DECOMPRESSED=$((FILE_DECOMPRESSED + 1)) || \
        echo"${f}: failed to decompress!"
    else
        echo "${f} possibly corrupted"
    fi
    
    echo ""
done

echo "============================"
echo "Clean Files:          ${FILE_CLEAN}"
echo "Corrupted Files:      $((FILE_TOTAL - FILE_CLEAN))"
echo "Decompressed Files:   $((FILE_DECOMPRESSED))"
echo "----------------------------"
echo "Total Files:          ${FILE_TOTAL}"

