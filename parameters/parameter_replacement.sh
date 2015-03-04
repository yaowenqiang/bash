#!/bin/bash
# parameter_replacement.sh

# ${parameter}
# 与$parameter相同，也就是变量parameter的值

your_id=${USER}-on-${HOSTNAME}
echo "$your_id"
