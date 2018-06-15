NAME="sqlite"
VERSION="3240000"
PACKAGE="$NAME-$VERSION"

FILE="$NAME-autoconf-$VERSION.tar.gz"
URL="https://www.sqlite.org/2018/$FILE"
SHA256SUM="d9d14e88c6fb6d68de9ca0d1f9797477d82fc3aed613558f87ffbdbbc5ceb74a"

pkg_extract() {
	tar xf "$FILE"
	mv "$NAME-autoconf-$VERSION" "$PACKAGE"
}
