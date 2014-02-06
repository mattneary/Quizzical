read resp; 
if [ -z "$resp" ]
then echo -n "F" && echo "" && echo "failure for test: $1"
else echo -n "."
fi
