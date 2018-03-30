NAME="python3"
VERSION="3.6.5"
PACKAGE="$NAME-$VERSION"

FILE="Python-$VERSION.tgz"
URL="https://www.python.org/ftp/python/$VERSION/$FILE"
SHA256SUM="53a3e17d77cd15c5230192b6a8c1e031c07cd9f34a2f089a731c6f6bd343d5c6"

pkg_extract() {
	tar xf "$FILE"
	mv "Python-$VERSION" "$PACKAGE"
}
