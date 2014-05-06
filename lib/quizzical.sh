#!/bin/bash
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
  echo "Generate Documentations:"
  echo "    quizzical tests.sh docs.md"
  exit 1
fi

if [ -z $2 ]
then
	echo "Performing tests in $1..."	
	cat /dev/null > .quizzical_error
	rm .quizzical_dumps/* 2> /dev/null
	mkdir .quizzical_dumps 2> /dev/null
	$QUIZZICAL_WAREHOUSE_DIR/test $@
	echo ""
	if [ 0 -ne `cat .quizzical_error | wc -l` ]
	then
	  echo "Tests failed:"
	  cat .quizzical_error | awk -F '|' '{print "  The failed response to \"" $1 "\" can be found at \".quizzical_dumps/" $2 "\"."}'
	else
	  echo "All tests passed."
	fi
else
	echo "Generating docs to $2..."
	$QUIZZICAL_WAREHOUSE_DIR/docs.sh $@	
	echo "Docs generated."
fi

