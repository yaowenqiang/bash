#!/bin/bash
# 将字符串由UTF-8转换为UTF-16并且打印到Booklist中
function write_utf8_string() {
    STRING=$1
    BOOKLIST=$2
    echo -n "$STRING" | iconv -f UTF8 -t UTF16 | cut -b 3- | tr -d \\n >>"$BOOKLIST"
}

