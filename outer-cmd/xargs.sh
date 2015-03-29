#!/bin/bash
# xargs.sh

ls -l | xargs
find /mail -type f | xargs grep "Linux"
ls | xargs -P -l gzip -k
# -p 交互式，提示用户确认
# -l 传递过来的参数按行执行
# 通过对比ls | xargs 与ls | xargs -l可明显看出区别
# git status | grep "删除" | awk '{print $2}' | xargs git checkout  恢复被gzip删除的原文件.
ls | xargs -n 8 echo  # 以每行8列的形式列出当前目录下的所有文件。
find / -type f -print0 | xargx -0 grep  -liwZ GUI | xargs -0 rm -f
grep -fliwZ GUI / | xargs -0 rm -f
