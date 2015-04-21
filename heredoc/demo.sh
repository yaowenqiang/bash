 #!/bin/bash - 
#===============================================================================
#
#          FILE: demo.sh
# 
#         USAGE: ./demo.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015-04-19 19:34
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

wall <<zzz23EndOfMessagezzz23
E-mail your noontime orders for pizza to the system administrator.
(Add an extra dollar for anchovy or mushroom topping.)
# 附加的消息文本放在这里。
# 注意:"wall"命令会把注释也打印出来。
zzz23EndOfMessagezzz23

# 当然，更有效率的做法是:
# wall <message-file
# 然而，将消息模板嵌入到脚本中，
# 只是一种小吃店(译者注：方便便是不卫生)的做法，而且这种做法是一次性。
exit 0
