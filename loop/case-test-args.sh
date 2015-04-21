#!/bin/bash
E_PARAM=65
case "$1" in
    "") echo "Usage: ${0##*/} <filename>";exit $E_PARAM;# 没有命令行参数
                                                        # 或者第一个参数为空，
# 注意：${$##*/}是${var##pattern}的一种替换形式，得到的结束为$0.
    ;;
    -*) FILENAME=./$1;;                     # 如果传递进来的文件娄($1)以一个破折号开头，
                                        # 那么用./$1来代替。
                                        # 这样后边的命令将不会把它作为一个选项来解释。
    * ) FILENAME=$1;;                       # 否则，$1.

esac                                    
echo $FILENAME

