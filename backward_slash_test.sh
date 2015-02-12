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
