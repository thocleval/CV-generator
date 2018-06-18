#!/bin/bash

if ! type relaxed > /dev/null; then
    echo This program needs relaxed to work
    echo run \'npm i -g relaxedjs\' to install it
else
    find ./Templates -name "*cv.pug" -exec relaxed {} --build-once \;
    mkdir -p PDFs
    find ./Templates -name "*cv.pdf" -exec mv -f {} ./PDFs \;
fi
