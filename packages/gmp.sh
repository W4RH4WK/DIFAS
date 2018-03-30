NAME="gmp"
VERSION="6.1.2"
PACKAGE="$NAME-$VERSION"

FILE="$PACKAGE.tar.bz2"
URL="https://ftp.gnu.org/gnu/gmp/$FILE"
SHA256SUM="5275bb04f4863a13516b2f39392ac5e272f5e1bb8057b18aec1c9b79d73d8fb2"

pkg_configure() {
	./configure --prefix="$DIFAS_PREFIX/$PACKAGE" --enable-cxx
}

pkg_check() {
	make check
}
