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
t=table_cell_3
table_cell_3=24
echo "\"table_cell_3\" = $table_cell_3"     # "table_cell_3" = 24
echo -n "dereferenced \"t\" = ";eval echo \$$t      # 解引用 "t" = 24
# 在这个简单的例子中，下面的表达式也能正常工作么？(为什么？).
# eval t=\$$t;echo "\"t\" = $t."        能正常工作，不过不是非常明白 TODO

echo

t=table_cell_3
NEW_VAL=387
table_cell_3=$NEW_VAL
echo "Changing value of \"table_cell_3\" to $NEW_VAL."
echo "\"table_cell_3\" new $table_cell_3"
echo -n "dereferenced \"t\" new ";eval echo \$$t
# "eval" 带有两个参数，"echo" 和 "\$$t"(与$table_cell_3等价)

# 另一个方法是使用${!t}符号 TODO 还没尝试过
exit 0

