#!/bin/bash
# unset.sh              "Unset" 一个变量

variable=hello          # 初始化
echo "variable = $variable"

unset variable                              # unset.
                                            # 与variable= 相同。
echo "(unset) variable = $variable"         # $variable设置为null
exit 0

