#!/bin/bash
# caller.sh         将caller命令放到函数中，将会在stdout上打印出函数的调用者信息。

function1()
{
    # 在function1内部。
    caller 0            # 显示调用信息。 
}
function1               # 脚本的第9行。

# 9 main caller.sh
# ^                     # 函数调用者所在的行号。
#   ....                # 从脚本的'main'部分开始调用的。
#        .........      # 调用脚本的名字。

caller 0                  # 没效果，因为这个命令不在函数中。
