#!/bin/bash
# index.sh

#expr index $string $substring
# 在字符串$string中所匹配到的$substring第一次所出现的位置
stringZ=abcABC123ABCabc
echo `expr index "$stringZ" C12`                    # 6
                                                    # C字符的位置。
echo `expr index "$stringZ" 1c`                     # 3
# 'c' (in #3 position) matches before '1'.
