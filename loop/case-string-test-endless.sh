#!/bin/bash
# 测试字符串范围。
while true
do
    echo;echo "HIt a key,then hit return,Hit x to quit;"
    read Keypress
        case "$Keypress" in
            x           ) break;;
            [[:lower:]] ) echo "Lowercase letter";;
            [[:upper:]] ) echo "Uppercase letter";;
            [0-9]       ) echo "Digit";;
            *           ) echo "Punctuation,whitespace,or other";;
        esac            # 允许字符串的范围出现在[括号]中
                        # 或者出现在POSIX风格的[[双中括号中。
done

# 在这个例子的第一个版本中，
# 测试大写和小写字符串的工作使用的是
# [a-z]和[A-z].
# 这种方法在某些特定场合的或某些linux发行版中不能够正常工作。
# POSIX 的风格更具有可移植性。

# 练习：
# --------
# 就像这个脚本所表现出来的，它只允许单次的按键，然后就结束了，
# 修改这个脚本，让它能够接受重复输入，
# 报告每次按键，并且只有在"x"被键入时才结束。
exit 0


