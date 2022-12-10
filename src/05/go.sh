#! /bin/bash

        case $param in

        1)
                for (( a=1; a < 6; i++ )); do
                        sort -k 9 ../04/$a.log -o sort$a.log
                done
        ;;

        2)
                for (( a = 1; a < 6; a++ )); do
                        awk '{print $1}' ../04/$a.log > sort$a.log
                done
        ;;

        3)
                for (( a = 1; a < 6; a++ )); do
                        awk '$9 ~ /[45]/' ../04/$a.log > sort$a.log
                done
        ;;

        4)
                for (( a = 1; a < 6; a++ )); do
                        awk '$9 ~ /[45]/' ../04/$a.log > temp.log
                        awk '{print $1}' temp.log > sort$a.log
                        rm temp.log
                done
        ;;
        esac

