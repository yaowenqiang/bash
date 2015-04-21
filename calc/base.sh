#!/bin/bash
#################################################################################
# 脚本          :       base.sh - 用不同的数制来打印数字(Bourne Shell)
# 作者          :       Heiner Steven(heiner.steven@odn.de)
# 日期          :       07-03-95
# 类型          :       桌面
# $ID:BASE.SH,V 1.2 2000/02/06 19:55:35 heiner Exp $
# ==> 上边这行是RCS id信息
#################################################################################
# 描述
#
# 修改记录
# 21-03-95 stv          fix error occuring with 0xb as input (0.2)
#################################################################################

NOARGS=65
PN=`basename $0`            # 程序名
VER=`echo '$Reversion: 1.2 $' | cut -d ' ' -f2`     # ==> VER=1.2
Usage () {
    echo "$PN - print number to different bases,$VER (stv '95)
    usage: $PN [number ...]
    If no number is given,the numbers are read from standard input,
    A number may be
    binary (base 2)         starting with 0b(i.e,0b1100)
    octal (base 8)          starting with 0 (i.e,014)
    hexadecimal (base 16)   starting with ox(i.e,ox0)
    decimal                 otherwise (i.e,12)" >&2
    exit $NOARGS
    # ==> 打印出用法信息的函数。
}

Msg () {
    for i           # ==> 省略[list]
    do
        echo "$PN:$1" >&2
    done
}

Fatal () { Msg "$@";exit 66;  }
PrintBases() {
    # 决定数字的数制
    for i           # ==> 省略[list]...
    do
        case "$i" in
            0b*)                        ibase=2;;       # 2 进制
            0x|[a-f]|[A-F]*)            ibase=16;;      # 16进制
            0*)                         ibase=8;;       # 8 进制
            [1-9]*)                     ibase=10;;      # 10进制
        *)
            Msg "illegal number $i - ignored"
            continue;;
        esac

    # 去掉前缀，将16进制数据转换为大写(bc命令需要这么做)
    number=`echo "$i" | sed -e 's:^0[bBxX]::' | tr '[a-f]' '[A-F]'`
    # ==> 使用":"作为sed分隔符，而不使用"/".

    # 将数字转换为10进制
    dec=`echo "ibase=$ibase;$number"| bc `      # ==>  'bc'是个计算工具
    echo $dec
    case "$dec" in
        [0-9]*);;                               # 数字没问题
        *) continue;;                           # 错误：忽略
    esac

    # 在一行上打印所有转换后的数字，
    echo `bc <<!
        obase=16;"hex=";$dec
        obase=10;"dec=";$dec
        obase=8;"oct=";$dec
        obase=2;"bin=";$dec
!
    ` | sed -e 's: :                :g'
    done
}

while [ $# -gt 0 ]
# ==> 这里必须使用一个'while循环'
# ==> 因为所有case都可能退出循环或者
# ==> 结束脚本。
do
    case "$1" in
        --) shift;break;;
        -b) Usage;;                 # 帮助信息.
        -*) Usage;;
        -*) Usage;;
         *) break;;                 # 第一个数字
    esac                            # 对于非法输入进行更严格检查是非常有用的。
    shift
done

if [ $# -gt 0 ]
then
    PrintBases "$@"
else
    while read line                 # 从stdin读取
    do
        PrintBases $line
    done
fi
exit 0

