#!/bin/bash
# userlist.sh
# 列出系统上的所有用户

PASSWORD_FILE=/etc/passwd
n=1         # User number

for name in $(awk 'BEGIN{FS=":"}{print $1}'<"$PASSWORD_FILE") 
    # 域分隔  = :
    # 打印第一个域
    # 从passwd文件中取得输入
do
    echo "USER #$n = $name"
    let "n += 1"
done

# USER #1 = root
# USER #2 = bin
# USER #3 = daemon
# ...
# USER #10 = bono

exit 0

# TODO
# 练习
# ----
# 一个普通用户(或者是一个普通用户运行的脚本)
# 怎么才能读取/etc/passwd呢?
# 这是否是一个安全漏洞，为什么呢？为什么不是?





