#!/bin/bash

if [[ $# != 0 ]]; then 
    echo "Parameters should not be"
else
    goaccess ../04/*.log --log-format=COMBINED -a -o index.html
fi

