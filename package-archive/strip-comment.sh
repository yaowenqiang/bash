#!/bin/bash
# strip-comment.sh;             去掉C程序中的注释(/* 注释 */)

E_NOARGS=0
E_ARGERROR=66
E_WRONG_FILE_TYPE=67
if [[ $# -eq "$E_NOARGS" ]]; then
    echo "Usage: `basename $0` C-program-file" >&2      # 将错误信息发到stderr,
    exit $E_ARGERROR
fi

# 检查文件类型是否正确。

type=`file $1 | awk '{print $2,$3,$4,$5}'`
# 'file $1' echo出文件类型...
# 然后awk会删除第一个域，就是文件名...
# 然后结果将会传递到变量'type'中.
# correct_type="ASCII C program text"
correct_type="C source, ASCII text"
# TODO 不同系统可能输出的type不一样，导致代码不能往下执行
if [ "$type" != "$correct_type" ]
then
    echo
    echo "This script works on C program files only."
    exit $E_WRONG_FILE_TYPE
fi

# 相当隐秘的sed脚本
#--------
sed '
/^\/\*/d
/\*\//d 
' $1
#--------
# 如果你花上几个小时来学习sed语法的话，上边这个命令还是很好理解的。

# 如果注释和代码在同一行上，上边的脚本就不行了，
# 所以需要添加一些代码来处理这种情况，
# 这是一个很重要的练习。

# 当然，上边的代码也会删除带有"*/"的非法注释行--
# 这也不是一个令人满意的结果。
exit 0

# --------------------------------------------------------------------------------
# 下边的代码不会执行，因为上边已经'exit 0'了
# TODO 下面的方法还没尝试

usage() {
    echo "Usage: `basename $0` C-program-file" >&2
    exit 1
}

WEIRD=`echo -n -e '\3777'`          # 或者WEIRD=$'\377'
(( $# -eq 1 )) || usage

case ` file "$1"` in 
    *"C program text"*) sed -e "s%/\*${WEIRD}%g;s%\*/%${WEIRD}%g" "$1" \
        | tr '\3777\n' '\n\3777' \
        | sed -ne 'p;n' \
        | tr -d '\n' | tr '\3777' '\n';;
    *) usage;;
esac
# 如果是下列的这些情况，还是很糟糕；
# printf("/*");
# 或者
# /*        /* buggy embended comment */
# 为了处理上边所有这些特殊情况(字符串中的注释，含有\*,\\" ...
# 的字符串中的注释)唯一的方法还是写一个c分析器，
# (或许可以使用lex或者yacc?)
exit 0


