NAME="ruby"
VERSION="2.5.1"
PACKAGE="$NAME-$VERSION"

FILE="$PACKAGE.tar.gz"
URL="https://cache.ruby-lang.org/pub/ruby/$(echo $VERSION | cut -f1,2 -d.)/$FILE"
SHA256SUM="dac81822325b79c3ba9532b048c2123357d3310b2b40024202f360251d9829b1"

pkg_configure() {
	./configure --prefix="$DIFAS_PREFIX/$PACKAGE" --enable-shared --disable-install-doc
}
