NAME="binutils"
VERSION="2.30"
PACKAGE="$NAME-$VERSION"

FILE="$PACKAGE.tar.gz"
URL="https://ftp.gnu.org/gnu/binutils/$FILE"
SHA256SUM="8c3850195d1c093d290a716e20ebcaa72eda32abf5e3d8611154b39cff79e9ea"

DEPENDS="bison"

export PATH="$(get_pkg_path bison)/bin:$PATH"

pkg_configure() {
	./configure --prefix="$DIFAS_PREFIX/$PACKAGE" --enable-gold
}
