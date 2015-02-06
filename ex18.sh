#!/bin/bash
# ex18.sh

# 是否"whois domain-name" 能够找到如下3个服务之一:
#       ripe.net,cw.net,radb.net

# 把这个脚本重命名为'wh', 然后放到/usr/local/bin 目录 下,

# 需要符号链接:
# ln -s /usr/local/bin/wh /usr/local/bin/wh-ripe
# ln -s /usr/local/bin/wh /usr/local/bin/wh--cwripe
# ln -s /usr/local/bin/wh /usr/local/bin/w-radbh-ripe
E_NOARGS=65

if [ -z "$1" ]
then
    echo "Usage: `basename $0` [domain-name]"
    exit $E_NOARGS
fi
# 检查脚本名字，
case `basename $0` in   #or case ${0##*/} in 
    "wh"         ) whois $1@whois.ripe.net;;
    "wh-ripe"    ) whois $1@whois.ripe.net;;
    "wh-radb"    ) whois $1@whois.radb.net;;
    "wh-cw"      ) whois $1@whois.cw.net;;
    "*"          ) echo "Usage: `basename $0` [domain-name]";;
esac
exit $?
