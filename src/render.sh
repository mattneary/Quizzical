read resp; 
if [ "$resp" != "Passed" ]
then
  hash=`openssl md2 <(echo "hello") \
      | awk '{print $2}'`
  echo -n "F" 
  echo "$1|$hash" >> .quizzical_error
  echo "$1" > ".quizzical_dumps/$hash"
else
  echo -n "."
fi
