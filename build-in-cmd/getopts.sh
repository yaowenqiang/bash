#!/bin/bash
# getopts.sh

while getopts ":abcde:fg" Option
# 开始声明
# a,b,c,d,e,f,和g被认为是选项(标志)
# 'e'后边的:提示这个选项需要带一个参数。
# 译者注：解释一下'a'前边的那个:的作用:
                    # 如果选项'a'不带参数进行调用的话，会产生一个错误信息，
                    # 这个开头的:就是用来屏蔽掉这个错误信息的。
                    # 因为我们一般都会有默认处理，所以并不需要这个错误信息。

do
    case $Option in
        a );; # 对选项'a'进行操作。
        b );; # 对选项'b'进行操作。
        #...
        e );; # 对选项'e'进行操作。
              # 这个变量里面将保存传递给选项'e'的参数。
        #...
        g );; # 对选项'g'作些操作。
    esac
done
shift $(($OPTIND  - 1))
# 将参数指针向下移动。
# 所有这些远没有它看起来那么复杂。<嘿嘿>.




