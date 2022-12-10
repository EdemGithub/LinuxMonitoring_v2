#! /bin/bash

export fileName="$(echo $2 | awk -F. '{print $1}')"
export fileExt="$(echo $2 | awk -F. '{print $2}')"
export filesize="$(echo $3 | awk -F"Mb" '{print $1}')"

START=$(date +%s%N)
TIMES=$(date +%H:%M)

if [[ $# == 3 ]]; then
	export param1=$1
	export param2=$2
	export param3=$3

	elif [[ ($1 =~ [0-9]) || ($1 =~ [^A-Za-z]) ||
	    (${#1} -gt 7) ]]; then
		echo "Names folders not true, bro.."
    		exit 1

	elif [[ ${#fileName} > 7 || ${#fileExt} > 3 ||
	    $fileName =~ [^A-Za-z] || $fileExt =~ [^A-Za-z] ||
   	 ($fileExt == "") || ${#fileName} < 1 ]]; then
   		 echo "Names files not true, bro.."
   		 exit 1

	elif [[ !($3 =~ Mb$) || ($filesize =~ [^0-9]) || ($filesize -gt 100) || ($filesize -le 0) ]]; then
		echo "Size not true.."
    		exit 1

else
	echo "Count of parameters not right"
	exit 1
fi

        chmod +x go.sh
        ./go.sh

        END=$(date +%s%N)
        DIFF=$((($END - $START)/1000000))
        TIMEE=$(date +%H:%M)
        echo "Start time: $TIMES"
        echo "End time: $TIMEE"
        echo "Script working $DIFF ms"

        echo "">>logFiles
        echo "Start time: $TIMES" >>logFiles
        echo "End time: $TIMEE" >>logFiles
        echo "Script working $DIFF ms" >>logFiles

