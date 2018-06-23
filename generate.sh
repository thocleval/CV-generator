#!/bin/bash

if ! type relaxed > /dev/null; then
    echo This program needs relaxed to work
    echo run \'npm i -g relaxedjs\' to install it
else

    if ! type icon-font-generator > /dev/null; then
        echo This program needs icon-font-generator to work
        echo run \'npm install -g icon-font-generator\' to install it
    else
        mkdir -p dist
        icon-font-generator icons/*.svg -o dist
        find ./Templates -name "*cv.pug" -exec relaxed {} --build-once \;
        mkdir -p PDFs
        find ./Templates -name "*cv.pdf" -exec mv -f {} ./PDFs \;
    fi
fi
