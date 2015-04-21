#!/bin/bash
# netcat 示例
# nc localhost.localdomain 25

# 使用netcat工具写的和DaveG写的ident-scan扫描器有同等功能的东西，
## 参数： target por [port port port port]
## 标准输出和标准输入被混到一块
##
## 优点：运行起来比ident-scan慢，这样远程机器inetd进行更不易注意而不会产生警告。
## 并且只有很少的知名端口会被指定，
## 缺点:要求数据端口参数，输出中无法区分标准输出和标准错误.
## 并且当远程服务监听在很高的端口时无法工作。

# ------------------------------
E_BADARGS=65            # 至少需要两个参数
TWO_WINKS=2             # 睡眠多长时间
THREE_WINKS=3
IDPORT=1113             # ident协议的认证端口
RAND1=999
RAND2=31337
TIMEOUT0=9
TIMEOUT1=8
TIMEOUT2=4
# ------------------------------
case "${2}" in
    "" ) echo "Need HOST and at least one PORT.";exit $E_BADARGS;;
esac

# 测试目标主机看是否运行了identd守护进程。
nc -z -w $TIMEOUT0 "$1" $IDPORT || { echo "Oops,$1 isn't unning identd.";exit 0;}
# -z 选项扫描监听进程。
# -w $TIMEOUT0 =尝试连接多长时间。
# 产生一个随机的本地起点源端口。
RP=`expr $$ & $RAND1 + $RAND2`
TRG="$1"
shift
while test "$1" ; do
    nc -v -w $TIMEOUT1 -P ${rp} "$trg" ${1} < /dev/null > /dev/null & PROC=$！
    sleep $THREE_WINKS

# 这看上去是不是像个残疾的脚本或是其他类似的东西?
# ABS作者评注：”这不是真的那么糟糕，事实上，做得非常聪明。"
kill -HUB $PROC
RP=`expr ${RP} +1`
shift
done
exit $?

# 注意事项：
# ========
# 试着把第30行去掉，
# 然后以"localhost.localdomain 25" 为参数来运行脚本，
# 关于Hobbit写的更多'nc'例子脚本，
# 可以在以下文档中找到：
# /usr/share/doc/nc-x.xx/scripts目录。
# TODO 完全没看懂



