#!/bin/bash
# readpipe.sh

last="(null)"
cat $0 |
while read line
do
    # echo "{$line}"
    echo "{$line}"
    last=$line
done
printf "\nAll done,last:$last\n"
exit 0      # 代码结束
            # 'echo'出了多余的大括号。
