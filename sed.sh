#!/bin/sh

# how to control sed command.

FILE=sed.txt

# 1. SSL line changed( first line character is S )
# ^SSL * --> SSL /root/a/b/c/d
sed -i "/^SSL/c\SSL /root/a/b/c/d" $FILE

# 2. In [section1] Section, 2 line changed. 
# user* --> user=jdjdsong
# passwd* --> passwd = papassword
sed -i \
        -e "/\(\[section1\]\)/,/\(^user[[:space:]]*=.*\)/s/user[[:space:]]*=.*/user=jdsong/g" \
        -e "/\(\[section1\]\)/,/\(^passwd[[:space:]]*=.*\)/s/passwd[[:space:]]*=.*/passwd = password/g" \
        $FILE

# 3. Change IP Address in String
# url=jdbc:mysql://XXX.XXX.XX.X:3306/mysql -->  url=jdbc:mysql://255.255.255.255:3306/mysql
sed -i "s/url=\"jdbc:mysql:\/\/\([0-9.]*\)/url=\"jdbc:mysql:\/\/255.255.255.255/gi" $FILE

# 4. Insert Comment(#). 
# addr * --> #addr *
sed -i "s/^paper/#paper/" $FILE

# 5. Replace all token to star
sed -i "s/./*/gi" $FILE


