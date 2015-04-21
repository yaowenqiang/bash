#!/bin/bash
# dirname.sh
a=/home/Administrator/.vimrc

echo "Basename of $a = `basename $a`"
echo "Dirname of $a = `dirname $a`"
echo
echo "My own home is `basename ~/` ."           # 'basename ~' 也可以
echo "The home of my home is `dirname ~/`."     # 'dirname ~' 也可以
