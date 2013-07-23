name=$1
shift
ruby $(dirname $0)/pipe.rb $* | $(dirname $0)/render.sh "$name"