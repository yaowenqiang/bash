#!/bin/rm
# 自删除脚本。
# 当你运行这个脚本时，基本上什么都不会发生。

WHATEVER=65

echo "This line will never print (betcha!)."

exit $WHATEVER  # 不要紧，脚本是不会在这的。
