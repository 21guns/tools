#!/bin/bash
str='id, shop_id, commodity_id, shelf_time, down_time, timing, status, gmt_created, gmt_modified,note'

#echo $str |awk -F, '{print $1}'

mails=$(echo $str | tr "," "\n")
RE=""
for addr in $mails
do
    # echo "$addr AS s$addr"
    RE="$RE, $addr AS s$addr"

done 
echo $RE