NAME="mpc"
VERSION="1.1.0"
PACKAGE="$NAME-$VERSION"

FILE="$PACKAGE.tar.gz"
URL="https://ftp.gnu.org/gnu/mpc/$FILE"
SHA256SUM="6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e"

DEPENDS="gmp mpfr"

GMP_PKG=$(get_pkg_path gmp)
MPFR_PKG=$(get_pkg_path mpfr)

export LD_RUN_PATH="$GMP_PKG/lib:$MPFR_PKG/lib"

pkg_configure() {
	./configure --prefix="$DIFAS_PREFIX/$PACKAGE" \
		--with-gmp="$GMP_PKG" \
		--with-mpfr="$MPFR_PKG"
}

pkg_check() {
	make check
}
