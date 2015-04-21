#!/bin/bash
# shift-example.sh
# 使用 ./scriptname 1 2 3 4 5来调用这个脚本

echo "$@"       # 1 2 3 4 5
shift
echo "$@"       # 2 3 4 5
shift
echo "$@"       # 3 4 5
shift
# 每次'SHIFT' 都会丢失$1.
# "$@" 将包信剩下的参数
exit 0

