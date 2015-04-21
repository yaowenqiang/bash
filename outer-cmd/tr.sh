#!/bin/bash
# tr.sh
# 必须使用引号或中括号，这样才是合理的。引号可以阻止shell重新解释出现在命令序列中的特殊字符，中括号应该被引用起来防止被shell扩展
# tr "A-Z" '*' <filename>
# tr A-Z \* <filename>两种都可以， 但是在某些系统上可能不能正常工作，
# tr A-Z '[**]' 在任何系统上都可以正常工作。

# -d 选项删除指定范围的字符。
echo "abcdef"               # abcdef
echo "abcdef" | tr -d b-d   # aef
tr -d 0-9   <filename
# 删除'filename'中的所有的数字.

# --squeesz-repeats    [或-s] 选项用来在重复字符序列中除去除第一个字符以外的所有字符，这个选项在删除多余空白的时候非常有用
echo "XXXXX" | tr -s 'X'            # X

# -c "complement" 选项将会反转匹配的字符集，通过这个选项，tr将只会对那些不匹配的字符起作用
echo "acfdeb123" | tr -c b-d *      # *c*d*b***

# tr 支持POSIX字符集
echo "abcd2ef1" | tr '[:alpha:]' -
