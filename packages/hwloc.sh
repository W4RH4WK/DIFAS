NAME="hwloc"
VERSION="2.0.1"
PACKAGE="$NAME-$VERSION"

FILE="$PACKAGE.tar.gz"
URL="https://www.open-mpi.org/software/hwloc/v$(echo $VERSION | cut -f1,2 -d.)/downloads/$FILE"
SHA256SUM="f1156df22fc2365a31a3dc5f752c53aad49e34a5e22d75ed231cd97eaa437f9d"

pkg_configure() {
	./configure --prefix="$DIFAS_PREFIX/$PACKAGE" --disable-libxml2
}

pkg_check() {
	make check
}
