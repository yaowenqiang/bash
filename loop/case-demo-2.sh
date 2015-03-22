#!/bin/bash
# 一个命令行参数处理的更容易理解的例子

while [ $# -gt 0 ];do
    case "$1" in
        -d|--debug)
            # 是'-d'或'--debug'参数?
            DEBUG=1
            ;;
        -c|--conf)
            CONFFILE="$2"’
            shift
            if [ ! -f $CONFFILE ];then
                echo "Error:Supplied file doesn't exist!"
                exit $E_CONFILE     # 错误：文件末发现.
            fi
            ;;
    esac
    shift       # 检查剩余的参数。
done
