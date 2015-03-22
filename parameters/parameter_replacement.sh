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
DEFAULT_FILENAME=generic.data
filename=${1:-$DEFAULT_FILENAME}
# 如果没有指定值，那么下面的代码将会使用filename
#+变量的默认值'generic.data'
# ${parameter=default},${parameter:=default}
# ${parameter=default}-如果变量parameter没被声明，那么就把它的值设为defualt
# ${parameter:=default}-如果变量parameter没被设置，那么就把它的值设为defualt
# 这两种形式基本一样的，只有在$parameter被声明并且被设置为null的时候，才会引起
#+这两种形式的不同


echo ${parameter1=`whoami`}     # 末声明，末设置

parameter1='whoami'             # 已设置
echo ${parameter1=`date`}       # 输出 whoami,因为parameter1忆经被覆辙，不会变成``date``

parameter3=                     # 已声明，没设置
echo ${parameter3:=`date`}       # 输出 `date`结果

# ${parameter+alt_value},${parameter:+alt_value}
# ${parameter+alt_value} - 如果变量parameter 被声明了，那么就使用alt_value，否则就使用null字符串
# ${parameter:+alt_value} - 如果变量parameter 被设置了，那么就使用alt_value，否则就使用null字符串
# 这两种形式绝大多数情况下都一样，只有在parameter被声明并且设置为nul值的时候，多出来的这个:才会引起这两种形式的不同
# example


echo '#####'\${parameter+alt_value}S ########''
echo

a=${param1+xyz}
echo "a = $a"       # a = 

param2=
a=${param2+xyz}      # a = xyz
echo "a = $a"        # a = xyz

param3=123
a=${param3+xyz}
echo "a = $a"       # a = xyz


echo
echo '#####\${parameter:+alter_value} ########'

a=${param4:+xyz}
echo "a = $a"       # a = 
param5=
a=${param5:+xyz}
echo "a = $a"       # a = param5设置为null时a的值不会发生变化
param6=123
a=${param6:+xyz}
echo "a = $a"       # a = xyz

# ${parameter?err_msg},${parameter:?err_msg}
# ${parameter?err_msg} - 如果parameter已经被声明，那么就使用设置的值，否则打印err_msg错误消息
# ${parameter:?err_msg} - 如果parameter已经被设置，那么就使用设置的值，否则打印err_msg错误消息
# 这两种形式绝大多数情况下都一样的，和上面边所讲的情况一样,只有在parameter被声明并且设置为nul值的时候，多出来的这个:才会引起这两种形式的不同
# 示例刚parameter-error.sh
