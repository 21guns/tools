#!/bin/bash
for file in $(ls .)
do
 if [[ $file != "release.sh" && $file != "gl.sh" ]]
 then
    echo "The project is: --------------------- $file -----------------------------------"
    cd $file
    git checkout develop
    git pull
    cd ..
 fi
done
