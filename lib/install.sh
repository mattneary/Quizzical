QUIZZICAL_WAREHOUSE_DIR="${QUIZZICAL_WAREHOUSE_DIR:-$HOME/.quizzical}"
BUILD_DIR=$(dirname $0)

cp -R $BUILD_DIR/../src $QUIZZICAL_WAREHOUSE_DIR
cp $BUILD_DIR/quizzical.sh /usr/local/bin/quizzical

echo "Quizzical has been installed."
echo ""
echo "Restart your terminal to use it in the form:"
echo "    quizzical [tests file]"
echo ""
echo "Get more information at http://github.com/mattneary/Quizzical"