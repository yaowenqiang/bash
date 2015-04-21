#!/bin/bash
# timed-out.sh

# TMOUT=3       在新一些的Bash脚本上也能运行的很好。

TIMELIMIT=3     # 这个例子中设置的3秒，也可以设置为其他的时间值.

PrintAnswer()
{
    if [ "$answer" = TIMEOUT ]
    then
        echo $answer
    else             # 别和上边的例子弄混了
        echo "Youre favorite veggle is $answer"         
        kill $!      # 不再需要后台运行的TimerOn 函数了，fill了吧.
                     # $!变量是上一个在后台运行的作业的PID
    fi
}

TimerOn()
{
    sleep $TIMELIMIT && kill -s 14 $$ &
    # 等待3秒，然后给脚本发送一个信号。
    # TODO 有点儿没看懂$$是什么意思
}

Int14Vector()
{
    answer="TIMEOUT"
    PrintAnswer
    exit 14
}


trap Int14Vector 14 # 定时中断(14) 会暗中给定时间限制 TODO 不是很理解

echo "what is your favorite vegetable?"
TimerOn
read answer
PrintAnswer

# 无可否认，这是一个定时输入的复杂实现，
#+然而"read"命令的"-t"选项可以简化这个任务，
# 参考后边的"t-out.sh"

# 如果你需要一个真正优雅的写法...
#+建议你使用c或c++来重写这个应用.
#+你可以使用合适的函数库，比如"alarm" 和"settimer"来完成这个任务。
exit 0



