#!/bin/bash
# type.sh

# type与外部命令which很相像，type cmd将会给出'cmd'的完整路径，
# 与which命令不同的是,type命令是Bash内建命令，-a 是type命令的
# 一个非常有用的选项，它用来鉴别参数是关键字还是内建命令，也可
# 以用来定位同名的系统命令。

type '['
type -a '['
