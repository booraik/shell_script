#!/bin/sh

# how to control sed command

FILE=sed.txt

# ^SSL * --> SSL /root/a/b/c/d
sed -i "/^SSL/c\SSL /root/a/b/c/d^" $FILE

#
sed -i \
        -e "/\(\[section1\]\)/,/\(^user[[:space:]]*=.*\)/s/user[[:space:]]*=.*/user=jdjdsong/g" \
        -e "/\(\[section1\]\)/,/\(^passwd[[:space:]]*=.*\)/s/passwd[[:space:]]*=.*/passwd = papassword/g" \
        $FILE


