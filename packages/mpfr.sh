NAME="mpfr"
VERSION="4.0.1"
PACKAGE="$NAME-$VERSION"

FILE="$PACKAGE.tar.gz"
URL="https://ftp.gnu.org/gnu/mpfr/$FILE"
SHA256SUM="e650f8723bfc6eca4f222c021db3d5d4cebe2e21c82498329bb9e6815b99c88c"

DEPENDS="gmp"

GMP_PKG=$(get_pkg_path gmp)

export LD_RUN_PATH="$GMP_PKG/lib"

pkg_configure() {
	./configure --prefix="$DIFAS_PREFIX/$PACKAGE" --with-gmp="$GMP_PKG"
}

pkg_check() {
	make check
}
