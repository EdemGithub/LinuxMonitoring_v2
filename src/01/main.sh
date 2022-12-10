#! /bin/bash


export filename=$(echo $5 | awk -F. '{print $1}')
export fileExt=$(echo $5 | awk -F. '{print $2}')
export filesize=$(echo $6 | awk -F"Kb" '{print $1}')


if [[ $# != 6 ]]; then
	echo "Parameters not 6"
	exit 1

elif [[ !(-d $1) ]]; then
	echo "1 parametr bad"
	exit 1

elif [[ ($2 =~ [^0-9]) || (($2 -gt 100) || ($2 -le 0)) ]]; then
        echo "2 parametr bad"
	exit 1

elif [[ ($3 -gt 7) || ($3 =~ [^A-Za-z]) ]]; then
	echo "3 parametr bad"
	exit 1

elif [[ $4 =~ [^0-9] || $4 -gt 100 ]]; then
	echo "4 parametr bad"
	exit 1

elif [[ ${#filename} > 7 || ${#fileExt} > 3 ||
 $filename =~ [^A-Za-z] || $fileExt =~ [^A-Za-z] ||
 $fileExt == "" || ${#filename} < 1 ]]; then
	echo "5 parametr bad"
	exit 1

elif  [[ !($6 =~ Kb) || ($filesize =~ [^0-9]) || ($filesize -gt 100) || ($filesize -le 0) ]]; then
	echo "6 parametr bad"
	exit 1

else
	export param1=$1
	export param2=$2
	export param3=$3
	export param4=$4
	export param5=$5
	export param6=$6

	chmod +x go.sh
	./go.sh
fi
