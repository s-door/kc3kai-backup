#!/bin/bash
set -e
set -u

# chrome profile Default,Profile 1,Profile 2,...
CHROME_PROFILE_DIR=~/.config/google-chrome/Default
# kc3kai extension id
KC3_EXTENSION_ID=hkgmldnainaglpjngpajnnjfhpdjkohh

DIR_NAME=KC3KAI-BACKUP-$(date '+%Y%m%dT%H%M%S%z')

if [ -e ${DIR_NAME} ]; then
    echo Error: \"${DIR_NAME}\" already exists.
    exit 1
fi

# create tmp directory
mkdir ${DIR_NAME}
CPTOPATH="${PWD}/${DIR_NAME}"

# copy target files
(
    cd ${CHROME_PROFILE_DIR}
    cp -pr --parents "Local Storage/leveldb" -t ${CPTOPATH}
    cp -pr --parents "IndexedDB/chrome-extension_${KC3_EXTENSION_ID}_0.indexeddb.leveldb" -t ${CPTOPATH}
)

# archive directory
zip -r ${DIR_NAME}.zip ${DIR_NAME}

# delete directory
rm -rf ${DIR_NAME}
