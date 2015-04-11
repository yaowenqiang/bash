#!/bin/bash
# dd-keypress.sh    记录按键，不需要按回车

keypresses=4                # 记录按键的个数

old_tty_settings=$(stty -g)     # 保存旧的终端设置。

echo "$Press $keypresses keys." # 禁用标准模式
# TODO 具体选项的含义不是很清楚
stty -icanon -echo              # 禁用本地echo.

keys=$(dd bs=1 count=$keypresses 2> /dev/null)
#  如果不指定输入文件的话，'dd'使用标准输入。
stty "$old_tty_settings"        # 恢复旧的终端设置

echo "You pressed the \"$keys\" keys."
exit 0
