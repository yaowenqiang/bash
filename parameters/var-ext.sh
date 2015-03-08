#!/bin/bash
# var-ext.sh
# 变量扩展/子串扩展

# $(var:pos)
# 变量var从位置开始扩展(译者注：也就是pos之前的字符都丢弃)
# $(var:pos:len)
# 变量var从pos开始，并扩展len个字符
# ${var/Pattern/Replacement}
# 使用Replacement来替换变量var中第一个匹配Pattern的字符串
# 如果省略Replacement，那么第一个匹配Pattern的字符串将会被替换为空，也就是被删除了。
# ${var//Pattern/Replacement}
# 全局替换，所有在变量var匹配Pattern的字符串，都会被替换为Replacement
# 和上边一样，如果省略Replacement, 那么所有匹配Pattern的字符串，都将被替换为空，也就是被删除掉。

var1=abcd-1234-defg
echo "var1 = $var1"

t=${var1#*-*}
echo "$var1 (with everything,up to and including first - stripped out) = $t"
#+ t=${var#*-}也一样，
#+ 因为#匹配最短的字符串，
#+ 同时*匹配任意前缀，包括空字符串。

t=${var##*-*}
echo "If var1 contains a \"-\",returns empty string...  var1 = $t"
#+ 全部匹配并删除

t=${var%*-*}
echo "$var1 (with everything from the last - on stripped out) = $t"
# TODO 输出为空，应该是全部被删除了，不是100%确定，后面在研究一下。

echo
#--------------------------------------------------------------------------------
path_name=/home/boro/ideas/thoughts.for.today
#--------------------------------------------------------------------------------
echo "path_name = $path_name"
t=${path_name##/*/}
echo "path_name,stripped of prefixes = $t"
