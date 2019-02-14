#!/bin/bash
function getdir(){
    for element in `ls $1`
    do  
        dir_or_file=$1"/"$element
        if [ -d $dir_or_file ]
        then 
            getdir $dir_or_file
        else
            # echo $dir_or_file
            ext=${dir_or_file##*.}
            if [ $ext == 'vue' ]
            then
                #使用 sed 与 cat 除去空白行
            	cat -s $dir_or_file | sed '/^[[:space:]]*$/d' >> results2.txt
        	fi
        fi  
    done
}
root_dir="/data/Develop/workspace/ktjr/ddhc/kt-ddhc-index/src"
getdir $root_dir