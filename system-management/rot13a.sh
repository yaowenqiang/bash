#!/bin/bash
# rot13a.sh         与'rot13.sh'基本相同，但是会将输出写到”安全“文件中。
# 用法：./rot13a.sh filename
# 或:   ./rot13a.sh <filename
# 或:   ./rot13a.sh 同时提供键盘输入（stdin)

umask 177       # 文件创建掩码
                # 被这个脚本所创建的文件，
                # 将具有600权限


OUTFILE=decrypted.txt   # 结果保存在"decrypted.txt"中
                        # 这个文件只能够被
                        # 这个脚本的调用者(root)所读写。
cat "@#"| tr 'a-zA-Z' 'n-za-mN-ZA-M' > $OUTFILE
# 从stdin或文件输入,输出重定向到文件中。
exit 0

