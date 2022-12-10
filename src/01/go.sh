#! /bin/bash

> log

foldersNames=$param3
lastLatterOfFoldersName=${param3: -1}
fileName=$filename
oldFileName=$fileName
lastLatterOfFileName=${fileName: -1}
logDate="$(date +"%d%m%y")"
newDate="DATE = $(date +"%d.%m.%y")"

mem="$(df -h / | awk 'NR==2{print $4 -1 + 1}')"

if [[ $mem < 1,0 ]]; then
	echo "System memory is less than 1 GB"
	exit 1
fi

if [[ ${#foldersNames} -lt 4 ]]; then
    for (( i=${#foldersNames}; i<4; i++ )); do
        foldersNames+="$(echo $lastLatterOfFoldersName)"
    done
fi

for (( i=1; i<=$param2; i++ )); do
    for (( j=1; j<=$param4; j++)); do
        echo ""$newDate" | "$param1"/"$foldersNames"_"$logDate"/"$fileName"."$fileExt"_"$logDate" | Size of file = $filesize Kb." >> log
        fileName+="$(echo $lastLatterOfFileName)"
    done
    fileName=$oldFileName
    foldersNames+="$(echo $lastLatterOfFoldersName)"
done
