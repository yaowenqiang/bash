#!/bin/bash
# parameter_replacement.sh

# ${parameter}
# 与$parameter相同，也就是变量parameter的值

your_id=${USER}-on-${HOSTNAME}
echo "$your_id"

#
echo "Old \$PATH = $PATH"
PATH=${PATH}:/opt/bin       # 在脚本生命周期中，/opt/bin会被添加到$PATH变量中。
echo "New \$PATH = $PATH"
# ${}
