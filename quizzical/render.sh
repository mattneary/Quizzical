read resp; 
if [ -z "$resp" ]
then echo "failure for test: $1"
else echo "success for test: $1"
fi