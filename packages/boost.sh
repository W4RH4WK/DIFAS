NAME="boost"
VERSION="1.66.0"
PACKAGE="$NAME-$VERSION"

FILE="${NAME}_${VERSION//./_}.tar.gz"
URL="https://dl.bintray.com/boostorg/release/$VERSION/source/$FILE"
SHA256SUM="bd0df411efd9a585e5a2212275f8762079fed8842264954675a4fddc46cfcf60"

BOOST_LIBS="atomic,date_time,filesystem,program_options,regex,system,serialization,thread,wave"

pkg_extract() {
	tar xf "$FILE"
	mv "${NAME}_${VERSION//./_}" "$PACKAGE"
}

pkg_configure() {
	./bootstrap.sh --prefix="$DIFAS_PREFIX/$PACKAGE" --with-libraries="$BOOST_LIBS"
}

pkg_build() {
	true
}

pkg_install() {
	./b2 cxxflags="$CFLAGS" release install "-j$SLOTS"
}
