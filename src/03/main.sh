#! /bin/bash

if [[ $# != 1 || $1 =~ [^0-9] ]]; then
	echo "Parametr bad Bro!"
	exit 1
else
	export param=$1
	chmod +x go.sh
	./go.sh
fi
