
# count ip address who accessed from httpd log files

# Usage: ./count.sh <file> <index>
#       <file> : support wildcard
#       <index> : IP address index in log file at seperate by space( " " )

# Example : ./count "/var/log/httpd/ssl_access_log*"
#           ./count "/var/log/httpd/ssl_request_log*" 3

FILE=${1:-access_log*}  # Default : access-log*
INDEX=${2:-1}           # Default : 1
cat $FILE | awk "{print $ $INDEX}" | sort |uniq -dc | sort -n
