NAME="luajit"
VERSION="2.0.5"
PACKAGE="$NAME-$VERSION"

FILE="LuaJIT-$VERSION.tar.gz"
URL="http://luajit.org/download/$FILE"
SHA256SUM="874b1f8297c697821f561f9b73b57ffd419ed8f4278c82e05b48806d30c1e979"

pkg_extract() {
	tar xf "$FILE"
	mv "LuaJIT-$VERSION" "$PACKAGE"
}

pkg_configure() {
	true
}

pkg_build() {
	make -j "$SLOTS" CFLAGS="-O3 -fPIC" LDFLAGS="-O3 -fPIC"
}

pkg_install() {
	make install PREFIX="$DIFAS_PREFIX/$PACKAGE"
}
