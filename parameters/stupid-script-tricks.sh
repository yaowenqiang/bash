#!/bin/bash
# stupid-script-tricks.sh       朋友，别在家试这个脚本，
# 来自于"Stupid Script Tricks"卷I.

dangerous_variable=`cat /boot/vmlinux` # 这是压缩过的Linux内核目录。

echo "string-length of \$dangerous_variable = ${#dangerous_variable}"
# 这个字符串变量的长度是\$dangerous_variable = 794151
# (不要使用as 'wc -c /boot/vmlinux' 来计算长度。)
# echo "$dangerous_variable"
# 千万别尝试这么做，这样将挂起整个脚本。
exit 0
