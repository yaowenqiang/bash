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
# ${parameter-default},${parameter:-default}
# ${parameter-default} - 如果变量parameter没被声明，那么就使用默认值
# ${parameter:-default} - 如果变量parameter没被设置，那么就使用默认值

echo ${username-`whoami`}
# ${parameter-default}和${parameter:-default}在绝大多数的情况下都是相同的，
#+只有在parameter已经被声明，但是被赋null值的时候，这个额外的才会产生不同的结果
# 
