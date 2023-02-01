#!/bin/bash

lockfile=/tmp/localfile
if ( set -o noclobber; echo "$$" > "$lockfile") 2> /dev/null


then
    FromDateTime=` head -n 1 /var/log/nginx/access.log|awk '{print $4}'|sed 's/\[//'|sed 's/\///g'|sed 's/\://g'`
    ToDateTime=`tail -n 1 /var/log/nginx/access.log|awk '{print $4}'|sed 's/\[//'|sed 's/\///g'|sed 's/\://g'`
    trap 'echo Dont stop me now' INT
    trap 'rm -f "$lockfile"; exit $?' TERM EXIT

    #создаем файл бекапа и очищаем исходный файл.
    cat /var/log/nginx/access.log > /var/log/nginx/$FromDateTime-$ToDateTime.log
    #удаление данных из файла
    #sed -i 'd' /var/log/nginx/access.log



    #echo "list of IP requests"
    IPs=`cat /var/log/nginx/access.log| awk '{print $1}'| sort   |uniq -c|sort -nr`

    #echo "Список запрашиваемых URL"
    URLs=`cat /var/log/nginx/access.log| awk '{print $6,$7,$8 }'| sort   |uniq -c|sort -nr`

    #echo "list response codes"
    Codes=`cat /var/log/nginx/access.log| awk '{print $9 }'| sort   |uniq -c|sort -nr`

    #echo "list of errors requests"
    Errors=`cat /var/log/nginx/error.log| awk '{print $6,$7,$8 }'| sort   |uniq -c|sort -nr`
    datetime1='echo date'

    echo -e "Данные за период: \n
    $FromDateTime-$ToDateTime
    \n"Часто запрашиваемые адреса:"\n$IPs
    \n\n"Список запрашиваемых URL:"\n$URLs
    \n\n"Возвращаемые коды:"\n$Codes
    \n\n"Частые ошибки:"\n$Errors
    \n\n  " | mail -s "NGINX Log Info" root@localhost
    
    while true ; do
    ls -ld ${lockfile}
    sleep 2
    done
else
    echo "Failed to acquire lockfile: $lockfile."
    echo "Held by $(cat $lockfile)"

fi

# 0**** root /home/vagrant/test.sh 
