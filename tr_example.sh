#!/bin/bash
# Author jack yao
# date 2013-06-03
#Purpose: Illustrate  using tr in a script to correct upper to lower filenames
myscriptname=`basename $0`
for i  in `ls -A`
do
    if [ $i = $myscriptname ] 
    then
        echo "sorry,can't rename myself"
    else
        newname=`echo $i | tr a-z A-Z`
        mv $i $newname
    fi
done




#END
