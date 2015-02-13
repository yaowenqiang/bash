#!/bin/bash
# backward_slash_test.sh
#  shell 反斜线输入测试脚本
echo "\\"               #结果是\
# 反之...

# echo "\"              #如果从命令行调用的话，会出现　SP2,也就是2级提示符
                        #如果在脚本中调用的话，那么会报错。

                        # 简单的转义和引用
echo \z                 # z
echo \\z                # \z
echo '\Z'               # \z
echo '\\z'              # \\z
echo "\z"               # \z
echo "\\z"              # \z

                        # 命令替换
echo `echo \z`          # z
echo `echo \\z`         # z
echo `echo \\\z`        # \z
echo `echo \\\\z`       # \z
echo `echo \\\\\\z`     # \z
echo `echo \\\\\\\z`    # \z
echo `echo "\z"`        # \z
echo `echo "\\z"`       # \z

                        # Here document
cat <<EOF
\z
EOF
cat <<EOF
\\z
EOF

# variable=\
# echo "$variable"
# 不能正常运行－会报错
# 一个"裸体的" 转义符是不能够安全的赋值给变量的
# 事实上在这里"\" 转义了一个换行符(变成了续行符的含义)
#+效果就是                              variable=echo "$variable"
#+                                      不可用的变量赋值
variable=\ 
#           \^转义一个空格
echo "$variable"                        # 显示空格

variable=\\
echo "$variable"                        # \
# variable=\\\
# echo "$variable"
# 不能正常运行 - 报错
# 第一个转义符把第2个\转义了，但是第3个又变成了"裸体"的了
variable=\\\\
echo "$variable"                        # \\
                                        # 第2个和第4个反斜线被转义了 
                                        # 这里是正确的
exit 0
