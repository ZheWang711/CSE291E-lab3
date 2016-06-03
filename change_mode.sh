#!/bin/bash

function chang_mod()
{
    chmod a+x *.sh
    chmod a+x *.py
    #echo *.sh
    for f in *; do
        if [[ -d $f ]]; then
            cd $f
            chang_mod
            cd ..
        fi
    done
}

chang_mod
