NAME="gcc"
VERSION="7.3.0"
PACKAGE="$NAME-$VERSION"

FILE="$PACKAGE.tar.gz"
URL="https://ftp.gnu.org/gnu/gcc/$NAME-$VERSION/$FILE"
SHA256SUM="fa06e455ca198ddc11ea4ddf2a394cf7cfb66aa7e0ab98cc1184189f1d405870"

DEPENDS="gmp mpc mpfr"

GMP_PKG=$(get_pkg_path gmp)
MPC_PKG=$(get_pkg_path mpc)
MPFR_PKG=$(get_pkg_path mpfr)

export LD_RUN_PATH="$GMP_PKG/lib:$MPC_PKG/lib:$MPFR_PKG/lib"

pkg_configure() {
	./configure --prefix="$DIFAS_PREFIX/$PACKAGE" \
		--with-gmp="$GMP_PKG" \
		--with-mpc="$MPC_PKG" \
		--with-mpfr="$MPFR_PKG" \
		--enable-languages="c,c++,fortran" \
		--without-isl \
		--disable-multilib \
		--enable-lto
}
