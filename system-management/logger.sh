#!/bin/bash
# logger.sh 附加一个用户产生的消息到系统日志中(/var/log/messages)
logger -t $0 -i Logging at line "$LINENO"
# "-t" 选项可以为日志入口指定标签。
# "-t" 选项记录进程ID

# tail /var/log/messages
# ..
# .........
exit 0
