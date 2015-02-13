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

# 非常有用的"if-grep" 风格
# ==============================

if grep -q Bash escaped.sh
then
    echo "file contains at least one occurrence of Bash."
fi

word=linux
letter_sequence=inu

if echo "$word" | grep -q "$letter_sequence"
# -q 选项是用来禁止输出的
then
    echo "$letter_sequence found in $word"
else
    echo "$letter_sequence not found in $word"
fi

if COMMAND_WHOSE_EXIT_STATUS_IS_0_UNLESS_ERROR_OCCURRED
then echo "Command succeeded."
else echo "Command failed"
fi

