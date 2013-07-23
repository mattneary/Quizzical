infile=$1
outfile=$2
cat $1 | ruby $(dirname $0)/docs.rb > $outfile