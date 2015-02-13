#!/bin/bash
# if_then_and_test_statement.sh
# 条件判断和测试
# TODO let和(()) 后面再看，现在还看不懂
let "1<2"       # return 0 (as "1<2" expands to "1")
(( 0 && 1  ))   # return 1 (as "0 && 1" expands to "0")

if cmp a b &> /dev/null             # 禁止输出
then echo "Files a and b are identical."
else echo "Files a and b are differ."
fi

