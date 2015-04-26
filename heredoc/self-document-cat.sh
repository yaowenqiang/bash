#!/bin/bash - 
#===============================================================================
#
#          FILE: self-document-cat.sh
# 
#         USAGE: ./self-document-cat.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/04/26 17:04
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
DOC_REQUEST=70
# sed 这一行不是完全懂，TODO 后面还要再看一下
if [ "$1" = "-h" -o "$1" = "--help" ]; then
    cat <<DOCUMENTATIONXXX
    List the statistics of a spceified directory in tabular format.
    ----------------------------------------------------
    The command line parameter gives the directory to be listed.
    If no directory specified or directory specified cannot be read,then list the current working directory.
DOCUMENTATIONXXX
exit $DOC_REQUEST
fi
exit 0
