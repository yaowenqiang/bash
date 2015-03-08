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


