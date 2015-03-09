#!/bin/bash
# ind-ref.sh        # 间接变量引用
# 访问一个以另外一个变量内容作为名字的变量的值。TODO 原翻译的不是很好，要查看一下英文原版仔细琢磨一下应该怎么翻译好。

a=letter_of_alphabet        # 变量"a"的值是另外一个变量的名字.
letter_of_alphabet=z
echo

# 直接引用
echo "a = $a"               # a = letter_of_alphabet
# 间接引用
eval a=\$$a
echo "Now a = $a"           # 现在a = z
echo

# 现在，让我们试试修改第二个引用的值。




