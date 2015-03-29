#!/bin/bash
# self-destruct.sh              一个结束自身的脚本程序

kill $$                         # 脚本将在此处结束自已的进程。
                                # 回忆一下，"$$"就是脚本的PID

echo "This line will not echo."
# 而且shell将会发送一个'Terminated'消息到stdout
exit 0

# 在脚本结束自身进程之前，
# 它返回的退出码是什么？
# sh self-destruct.sh
# 143
# 143 = 128 + 15
#               结束信息
