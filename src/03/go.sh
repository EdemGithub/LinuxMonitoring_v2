#! /bin/bash


date="$(cat ../02/logFiles | awk -F'|' '{print $2}' | awk -F'_' '{print $3}')"
newDate=${date: -7}

case $param in
	1)
        	dfiles1="$(cat ../02/logFiles | awk -F'|' '{print $2}')"
        	for i in $dfiles1
        	do
            	rm -rf $i
        	done
        	rm ../02/logFiles
    	;;

    	2)
       		echo "Insert FROM >DATE< >TIME< Example: >YYYY-MM-DD HH:MM<"
        	read srcDate srcTime
        	echo "Insert FROM >DATE< >TIME< Example: >YYYY-MM-DD HH:MM<"
        	read dstDate dstTime
        	rm -r $(find / -newermt "$srcDate $srcTime" -not -newermt "$dstDate $dstTime+1" 2>/dev/null | grep $newDate | sort) 2>/dev/null
        	rm ../02/logFiles
    	;;

	3)
	cd
	rm -r *$newDate
	cd /
	rm -r /boot/*$newDate
	rm -r /cdrom/*$newDate
	rm -r /etc/*$newDate
	rm -r /home/*$newDate
	rm -r /lib/*$newDate
	rm -r /lib32/*$newDate
	rm -r /lib64/*$newDate
	rm -r /libx32/*$newDate
	rm -r /media/*$newDate
	rm -r /mnt/*$newDate
	rm -r /opt/*$newDate
	rm -r /proc/*$newDate
	rm -r /run/*$newDate
	rm -r /snap/*$newDate
	rm -r /srv/*$newDate
	rm -r /tmp/*$newDate
	rm -r /usr/*$newDate
	rm -r /var/*$newDate
    	;;

    	*)
    	echo "Default bro..!"
    	;;
    	esac
