#! /bin/bash

if [[ $# != 1 || $1 =~ [^1-4] ]]; then
    echo "Parametr ist bad.."
else
	export param=$1
	chmod +x go.sh
	./go.sh
fi
