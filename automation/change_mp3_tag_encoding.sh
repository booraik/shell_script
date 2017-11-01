#!/bin/bash
# Change mp3 encoding cp949 to UTF
# Reference : http://egloos.zum.com/mcchae/v/11174534
# needed mutagen python package : pip install mutagen

find $1 -iname "*.mp3" -execdir mid3iconv -e cp949 {} \;
