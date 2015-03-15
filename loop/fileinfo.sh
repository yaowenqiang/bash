#!/bin/bash
# fileinfo.sh

FILES="/usr/sbin/accept
/usr/sbin/pwck
/usr/sbin/chroot
/usr/bin/fakefile
/sbin/badblocks
/sbin/ypbind"           # 这是你所关心的文件列表。
                        # 扔进去一个假文件，/usr/bin/fakefile
echo

for file in $FILES
do
    if [ ! -e "$file" ]
    then
        echo "$file does not exists.";echo
        continue
    fi
    ls -l $file | awk '{print $9 "       file size:" $5 }'    # 打印两个域
    whatis `basename $file`             # 文件信息
    #  注意whatis数据库需要提前建立好
    # 要想达到这个目的，以root身份进行:/usr/bin/makewhatis
    echo
done

exit 0


