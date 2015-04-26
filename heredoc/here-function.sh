#!/bin/bash - 
#===============================================================================
#
#          FILE: here-function.sh
# 
#         USAGE: ./here-function.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/04/26 14:35
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

GetPersonalData ()
{
    read firstname
    read lastname
    read address
    read city
    read state
    read zipcode
} # 这个函数看起来就是一个交互函数，便量...
# 给上边的函数提供输入，
GetPersonalData <<RECORD001
Bozo
Bozeman
2726 Nodescript Dr.
Baltimore
MD
21226
RECORD001

echo 
echo "$firstname $lastname"
echo "$address"
echo "$city $state $zipcode"
echo
exit 0
