#!/bin/bash
# substring.sh

expr match "$string" "$substring"
# $substring是一个正则表达式

expr "$string":"$substring"

stringZ=abcABC123ABCabc
#

echo `expr match "$stringZ" "abc[A-Z]*.2"`  # 8
echo `expr  "$stringZ" : "abc[A-Z]*.2"`     # 8


