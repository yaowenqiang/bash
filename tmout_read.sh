#!/bin/bash
# tmout_read.sh  #tmout和read结合使用

# 只能够在Bash脚本中使用，必须使用2.05b或之后版本物Bash.

TMOUT=3         # 提示输入时间为3秒
echo "What is your favorite song?"
echo "Quickly now,you only have $TMOUT seconds to answer!"
read song
if [ -z "$song" ]
then
    echo "(no answer)"
    # 默认响应.
fi

echo "Your favorite song is $song."
exit 0

