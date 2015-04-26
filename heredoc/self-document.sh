#!/bin/bash - 
#===============================================================================
#
#          FILE: self-document.sh
# 
#         USAGE: ./self-document.sh 
# 
#   DESCRIPTION: 一个自文档化(self-documenting)有脚本化(self-documenting)的脚本.
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/04/26 15:46
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

DOC_REQUEST=70
if [ "$1" = "-h" -o "$1" = "--help" ]; then
    echo;echo "Usage: $0 [directory-name]";echo
    sed --silent -e '/DOCUMENTATIONXXX$/,/^DOCUMENTATIONXXX/p' "$0" | sed -e '/DOCUMENTATIONXXX$/d';exit $DOC_REQUEST;
fi

: <<DOCUMENTATIONXXX
List the statistics of a spceified directory in tabular format.
----------------------------------------------------
The command line parameter gives the directory to be listed.
If no directory specified or directory specified cannot be read,then list the current working directory.
DOCUMENTATIONXXX
if [-z "$1" -o ! -r "$1"]; then
    directory=.
else
    directory="$1"
fi

echo "Listing of \"$directory\":";echo
(printf"PERMISSIONS LINKS ONWER  GROUP SIZE MONTH DAY hh:mm proc-name\n" \
    ;ls -l "$directory" | sed ld) | column -t
exit  0

