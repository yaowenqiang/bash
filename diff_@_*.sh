#!/bin/bash
# diff_$@_$*.sh
# TODO要仔细看一遍才行

# 内部Bash变量"$*" 和"$@"的古怪行为。
#+都依赖于它们是否双绰号被引用起来。

set -- "First one" "second" "third:one" "" "fifth: :one"
# 设置这个脚本的参数，$1,$2,等等
echo 'IFS unchanged,using "$*"'
c=0
for i in "$*" ; do          # 引用起来
    echo "$((c+=1)); [$i]"  # 这行在下边每个例子中都一样
                            # 打印参数
done

echo ---
echo 'IFS unchanged,using $*'
c=0
for i in $* ; do
    echo "$((c+=1)); [$i]"
done
echo ---

echo 'IFS unchanged,using "$@"'
c=0
for i in "$@" ; do
    echo "$((c+=1)); [$i]"
done
echo ---

echo 'IFS unchanged,using $@'
c=0
for i in "$@" ; do
    echo "$((c+=1)); [$i]"
done
echo ---

# TODO 修改好像没起作用
IFS=:
echo 'IFS=":",using "$*"'
c=0
for i in "$@" ; do
    echo "$((c+=1)); [$i]"
done
echo ---

echo 'IFS=":",using $*'
c=0
for i in "$@" ; do
    echo "$((c+=1)); [$i]"
done
echo ---

var=$*
echo 'IFS=":",using "$var"(var=$*)'
c=0
for i in "$var" ; do
    echo "$((c+=1)); [$i]"
done
echo ---

echo 'IFS=":",using $var(var=$*)'
c=0
for i in $var ; do
    echo "$((c+=1)); [$i]"
done
echo ---

var="$*"
echo 'IFS=":",using $var(var="$*")'
c=0
for i in $var ; do
    echo "$((c+=1)); [$i]"
done
echo ---

echo 'IFS=":",using "$var"(var="$*")'
c=0
for i in "$var" ; do
    echo "$((c+=1)); [$i]"
done
echo ---

echo 'IFS=":",using "$@"'
c=0
for i in "$@" ; do
    echo "$((c+=1)); [$i]"
done
echo ---
echo 'IFS=":",using $@'
c=0
for i in $@ ; do
    echo "$((c+=1)); [$i]"
done
echo ---
var=$@
echo 'IFS=":",using $var(var=$@)'
c=0
for i in $@ ; do
    echo "$((c+=1)); [$i]"
done
echo ---
echo 'IFS=":",using "$var"(var=$@)'
c=0
for i in "$@" ; do
    echo "$((c+=1)); [$i]"
done

var="$@"
echo 'IFS=":",using "$var"(var="$@")'
c=0
for i in $@ ; do
    echo "$((c+=1)); [$i]"
done
echo ---
echo 'IFS=":",using $var(var="$@")'
c=0
for i in "$@" ; do
    echo "$((c+=1)); [$i]"
done

echo

# 使用ksh或者zsh -y 来试试这个脚本

exit 0
