#!/bin/bash
# string-substitution.sh
# 子串替换

# ${string/substring/replacement}
# 使用replacement来替换第一个匹配的substring
# ${string//substring/replacement}
# 使用replacement来替换所有匹配的substring

stringZ=abcABC12ABCabc
echo ${stringZ/abc/xyz}         # xyzABC123ABCabc
                                # 使用'xyz'来替换第一个匹配的'abc'.

echo ${stringZ//abc/xyz}        # xyzABC123ABCxyz
                                # 使用'xyz'来替换所有匹配的'abc'.
# ${string/#substring/replacement}
# 如果$substring匹配$string的开头部分，那么就用$replacement来替换$substring
# ${string/%substring/replacement}
# 如果$substring 匹配$string的结尾部分，那么就用$replacement来替换substring


stringZ=abcABC12ABCabc
echo ${stringZ/#abc/XYZ}                # XYZABC12ABCabc
                                        # 用XYZ 替换开头的'abc'
echo ${stringZ/%abc/XYZ}                # abcABC12ABCXYZ
                                        # 用XYZ 替换结尾的'abc'

echo ${stringZ/#ABC/XYZ}                # abcABC12ABCabc
                                        # ABC没有匹配$stringz的开头，所以不会发生替换

echo ${stringZ/%ABC/XYZ}                # abcABC12ABCabc
                                        # ABC没有匹配$stringz的结尾，所以不会发生替换

