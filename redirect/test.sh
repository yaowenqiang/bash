#!/bin/bash - 
#===============================================================================
#
#          FILE: test.sh
# 
#         USAGE: ./test.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015-04-18 11:59
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

COMMAND_SCRIPT >
    # 将stdout重定向到一个文件，
    # 如果这个文件不存在，那就创建，否则就覆盖。

ls -lR > dir-tree.list
    # 创建一个包含目录树列表的文件。

: > filename
    # >操作，将会把文件"filename"变为了个空文件(就是size为0)
    # 如果文件不存在，那么就二个0长度的文件(与'touch'的效果相同).
    # :是一个占位符，不产生任何输出。

> filename
    # >操作，将会把文件'filename'变为一个空文件(就是size为0).
    # 如果文件不存在，那么就二个0长度的文件(与'touch'的效果相同).
    # (与上边': >'效果相同，但某些shell可能不支持这种形式。)

COMMAND_SCRIPT >>
    # 将stdout重定向到一个文件。
    # 如果文件不存在，那么就创建它，如果存在，那么就追加到文件后边。
   
    # 单行重定向命令(只会影响他们所在的行):
    # --------------------------------------------------------------------------------
    1>filename
    # 重定向stdout到文件'filename'.
    1>>filename
    # 重定向并追加stderr到文件'filename'.

    2>filename
    # 重定向stderr到文件'filename'.
    2>>filename
    # 重定向并追加stderr到文件'filename'.

    &>filename
    # 将stdout和stderr都重定向到文件'filename'.

    M>N
    # "M"是一个文件描述符，如果没有明确指定的话默认为１,
    # "N"是一个文件名，
    # 文件描述符"M"被重定向到文件'N'.

    M>&N
    # "M"是一个文件描述符，如果没有明确指定的话默认为１,
    # "N"是另一个文件描述符.

    #================================================================================
    # 重定向stdout,一次一行，
    LOGFILE=script.log
    echo "This statement is sent to the log file,\"$LOGFILE\"." 1>$LOGFILE
    echo "This statement is append to the log file,\"$LOGFILE\"." 1>>$LOGFILE
    echo "This statement is also append to the log file,\"$LOGFILE\"." 1>>$LOGFILE
    echo "This statement is echoed to stdout,and will not appear in \"$LOGFILE\"."
    # 每行过后，这些重定向命令会自动'reset'

    # 重定向stderr,一次一行，
    ERRORFILE=script.errors
    bad_command1 1>$ERRORFILE       # Error message sent to $ERRORFILE
    bad_command1 2>>$ERRORFILE      # Error message appended to $ERRORFILE
    bad_command1 3                  # Error message echoed to stderr.
                                    # and does not appear in $ERRORFILE
    # 每行过后，这些重定向命令会自动'reset'
    #================================================================================

    2>&1
        # 重定向stderr到stdout.
        # 将错误消息的输出，发送到与标准输出所指向的地方。
    i>&j
        # 重定向文件描述符i到j.
        # 指向i文件的所有输出都发送到j.
    >&j
        # 默认的，重定向文件描述符i(stdout)到j.
        # 所有传递到stdout的输出都送到j中去。
    0< FILENAME
     < FILENAME
        # 从文件中接受输入，
        # 与">"是成对命令，并且通常都是结合使用。
        # 
        # grep search-word < filename

    # TODO 这个真心没看懂
    [j]<>filename
        # 为了读写'filename',把文件'filename'打开，并且将文件描述符'j'分配给它，
        # 如果文件'filename'不存在，那么就创建它，
        # 如果文件描述符'j'没指定，那默认是fd 0 ,stdin.
        #
        # 这种应用通常是为了写到一个文件中指定的地方。
    echo 12345678910 > File                 # 写字符串到"File".
    echo 3 <> file                          # 打开"File"并且将fd 3 分配给它.
    read -n 4 <&3                           # 只读取4个字符。
    echo -n . <&3                           # 写一个小数点。
    exec 3>*&-                              # 关闭fd 3.
    cat File                                # ==> 1235.67890

    # 随机访问。
    |
    # 管道.
    # 通用目的处理和命令链工具。
    # 与">",很相似，便是实际上更通用。
    # 对于想将命令，脚本，文件和程序串连起来的时候很有用。
    cat *.txt | srot | uniq > result-file
    # 对所有.txt文件的输出进行排序，并且删除重复行。
    # 最后将结果保存到'result-file'文件中。

    可以将输入输出重定向和(或)管道的多个实例结合到一起写在同一行上。
    command < input-file > output-file
    command1 | command2| command3 > output-file

    可以将多个输出流重定向到到一个文件上。
    ls -yx >> command.log 2>&1
    # 将错误选项'yx'的结果放到文件'command.log'中。
    # 因为stderr被重定向到这个文件中。
    # 所有的错误消息也就都转向那里了。

    # 注意，"下边这个例子就不会输出相同的结果。"
    ls -yz 2>&1 >> command.log

    # 输出一个错误消息，但是并不写到文件中。

    # 如果将stdout和stderr都重定向，
    # 命令的顺序会有些不同

    n>&-
        # 关闭输入文件描述符n
    0<&-,<&-
        # 关闭stdin
    n>&-
        # 关闭输出文件描述符n.
    1>&-,>&-
        # 关闭stdout.
    # 只将stderr重定向到一个管道。
    exec 3>&1                   # 保存当前stdout的'值'
    # TODO 有点儿复杂，后面再研究。
    ls -l 2>&1 >&3 3>&- | grep bad 3>&-
                                # 对'grep'关闭fd 3(但不关闭'ls')

    exec 3 > &-                 # 对于剩余的脚本来说，关闭它。
