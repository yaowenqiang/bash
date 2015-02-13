#!/bin/bash
# reverse_exit_code.sh

true    # "true" 是内建命令

echo "exit status of \"true\" = $?"     # 0

! true

echo "exit status of \"!true\" = $?"     # 1
# 注意,"!" 需要一个空格。
#       !true 将导致"command not found" 错误
#

true
!true
# 这次就没有错误了，也没有反转结果。
# TODO 书上说可以，不过执行了还是会报错，直接在命令行里面运行是正确的，后面再研究一下
# 它只是重复了之前的命令(true)
