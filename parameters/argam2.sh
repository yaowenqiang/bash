#!/bin/bash
# agram2.sh     找anagram(回文构词法，可以将一个有意义的单词，变换为一个或多个有意义的单词，但是还是原来的字母集合)
# 关于命令替换嵌套的例子。
# 使用"anagram"工具
# 这是'yawl'文字表软件中的一部分。
# http://ibiblio.org/pub/Linux/libs/yawl-0.3.2.tar.gz
# http://personal.riverusers.com/~thegrendel/yawl-0.3.2.tar.gz
E_NOARGS=65
E_BADARG=66
MINLEN=7
if [[ -z "$1" ]]; then
    echo "Usage: $0 LATTERSET"
    exit $E_NOARGS
elfi [ ${#1} -le $MINLEN ]
then
    echo "Argument must have at least $MINLEN letters."
    exit $E_BADARG
fi


FILTER="......."            # 必须至少有7个字符。　
#　     1234567
Anagrams=( $(echo $(Anagrams $1 | grep $FILTER)))
#            |     |   嵌套的命令替换         | |
#        (              数组分配                )


echo
echo "${#Anagrams[*]}   7+ letter anagrams found."
echo
echo ${Anagrams[0]}         # 第一个anagram
echo ${Anagrams[1]}         # 第二个anagram
                            # 等等
# 考虑到后边还有单独的一章，对"数组"进行详细的讲解，
# 所以在这里就不深入讨论了。
# 可以参考脚本Agram.sh,这也是一个找出anagram的例子。
exit $?
