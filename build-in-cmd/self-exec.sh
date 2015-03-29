#!/bin/bash
# self-exec.sh              一个exec自身的脚本。

echo

echo "This line appears ONCE in the script,yet it keeps echoing."
echo "The PID of this instance of the script is still $$."
# 上边这行展示了并没有fork出子shell

echo "==================== Hit Ctrl-C to exit ==================== "
sleep 1
exec $0                     # 产生了本脚本的另一个实例。
                            # 但是这个新产生的实例却代替了原来的实例。
echo "Tlhis line will never echo "          # 为什么不是这样?TODO 没看懂什么意思，需要看一下英文原版。
exit 0
