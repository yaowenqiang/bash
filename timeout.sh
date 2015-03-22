#!/bin/bash
# timeout.sh

# 由Stephane Chazelas所编号。
#+本书作者做了一些修改。
INTEVAL=5                   # 超时间隔

timeout_read() {
    timeout=$1
    varname=$2
    old_tty_setting=`stty -g`
    stty -icanon min 0 time ${timeout}0     #TODO 看不懂
    eval read $varname          # 或者仅仅读取$varname变量
                                # TODO 超时时会报错
    stty "$old_tty_setting"
    # 参考 stty的man页。
}
echo;
echo -n "What's your name?Quick!"
timeout_read $INTEVAL your_name

# 这种方法可能并不是在每种终端类型上都可以正常使用的，
# 最大的超时时间依赖于具体的中断类型
#+(通常是25.5秒)
echo
if [ ! -z "$your_name" ]        # 如果在超时之前名字被键入...
then
    echo "Your name is $your_name"
else
    echo "Time out."
fi

# 这个脚本的行为可能与脚本"timed-out.sh" 的行为有些不同，
# TODO 两个脚本要进行对比一下
#+每次按键，计时器都会重置

exit 0
