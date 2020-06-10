#!/bin/bash
PLACEHOLDER=__placeholder__
find -type f -name "*.py" -exec md5sum '{}' \; | sed "s|./||"> md5sum.txt

#sed -e "s:\${MD5SUM}:`cat md5sum.txt | sed -z "s/\n/$PLACEHOLDER/g"`:g" -e "s/$PLACEHOLDER/\n/g" README.md.in
sed -e "s/\${MD5SUM}/`cat md5sum.txt | sed -z "s/\n/$PLACEHOLDER/g"`/" -e "s/$PLACEHOLDER/\n/g" -e "s/\${NAME}/austin/" -e "s/\${TWITTER}/@austinkeeley/" README.md.in


