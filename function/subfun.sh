#!/bin/bash - 
#===============================================================================
#
#          FILE: subfun.sh
# 
#         USAGE: ./subfun.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/01 21:56
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

f1()
{
    f2()
    {
        echo "Function \"f2\" inside \"f1\"."
    }
}
f2
f1
f2
exit 0
