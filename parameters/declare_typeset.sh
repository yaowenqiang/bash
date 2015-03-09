#!/bin/bash
# declare_typeset.sh
# declare 或者typeof内建命令(这两个命令是完全一样的)允许指定变量的具体类型，,在某些编程语言中，这是指定变量类型的一种很弱的方式
# declare/typeof 选项:
# -r 只读
#       declare -r var1
#       (declare -r var1 与 readonly var1 是完全一样的)

# -i 整形
declare -i number
# 脚本将会把变量"number"按照整形进行处理。
number=3
echo "number = $number"     # Number = 3

number=three
echo "number = $number"     # Number = 0
# 脚本尝试把字符串"three"作为整数来求值


# 如果把一个变量指定为整形的话， 那么即使没有expr或者let命令，也允许使用特定算述运算
n=6/3
echo "n = $n"               # n = 6/3
declare -i n
n=6/3
echo "n = $n"               # n = 2

# -a 数组

# declare -a indices
# 设置变量indices 为数组

# -f 函数
# declare -f 
# 如果在脚本中使用declare -f 而不加任何参数的话，那么将会列出这个脚本之前定义的所有函数。
# declare -f function_name
# 如果在脚本中使用declare -f function_name这种形式的话，将只会列出这个函数的名字。

# -x export
# declare -x var3
# 这句将会声明一个变量，并作为这个脚本的环境变量被导出
# -x var=$value
# declare命令允许在声明变量类型的同时给变量赋值

func1 ()
{
    echo this is a function.
}

declare -f      # 列出前面定义的所有函数

echo
declare -i var1  # var1 是个整形变量
var1=2367
echo "var1 declared as $var1"
var1=var1+1      # 整形变量的声明并不需要使用'set'命令
echo "var1 incremented by 1 is $var1"
# 尝试修改一个已经声明为整形变量的值。
echo "Attempting to change var1 to floating point value,2367.1."
var1=2367.1     # 产生错误信息，并且变量并没有被修改过。
echo "var1 is still $var1"
echo
declare -r var2=13.36           # 'declare' 允许设置变量的属性
                                # 同时给变量赋值
echo "var2 declared as $var2"   # 试图修改只读变量的值
var2=13.37                      # 产生错误消息，并且从脚本退出

echo "var2 is still $var2"      # 将不会执换行到这行

foo()
{
    FOO="bar"
}

bar ()
{
    foo
    echo $FOO
}
bar     # 打印bar

foo()
{
    declare FOO="bar"
}
bar()
{
    foo
    echo $FOO
}
bar         # 脚本也不会打印,TODO,貌似还是打印了
exit 0
