QUIZZICAL_WAREHOUSE_DIR="${QUIZZICAL_WAREHOUSE_DIR:-$HOME/.quizzical}"

if [ -z $1 ]; then
  echo "Quizzical is a test suite for JSON APIs."
  echo "Find out more at http://github.com/mattneary/quizzical."
  echo ""
  echo "Get Help:"
  echo "    quizzical"
  echo ""
  echo "Run Tests:"
  echo "    quizzical tests.sh"
  echo ""
  echo "Generate Documentation:"
  echo "    quizzical tests.sh docs.md"
  exit 1
fi

if [ -z $2 ]
then
	echo "Performing tests in $1..."	
	$QUIZZICAL_WAREHOUSE_DIR/test $@
	echo ""
	echo "Tests complete."
else
	echo "Generating docs to $2..."
	$QUIZZICAL_WAREHOUSE_DIR/docs.sh $@	
	echo "Docs generated."
fi