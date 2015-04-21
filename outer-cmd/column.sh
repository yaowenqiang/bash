#!/bin/bash
# column.sh     
(printf "PERMISSION LINKS OWNER GROUP SIZE MONTH DAY EE::MM PROG-NAME\n" \
    ; ls -l | sed 1d) | column -t
# 管道中的'sed 1d'删除输出中的第一行，
# 第一行将是'total N',
# 基中'N'是'ls -l'找到的文件总数,
# "colunh" 中的-t选项用来转化为易于打印的表形式。
exit 0
