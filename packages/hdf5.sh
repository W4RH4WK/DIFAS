NAME="hdf5"
VERSION="1.8.20"
PACKAGE="$NAME-$VERSION"

FILE="$PACKAGE.tar.gz"
URL="https://support.hdfgroup.org/ftp/HDF5/current18/src/$FILE"
SHA256SUM="6ed660ccd2bc45aa808ea72e08f33cc64009e9dd4e3a372b53438b210312e8d9"

DEPENDS="zlib"

export LD_RUN_PATH="$ZLIB_PKG/lib"

pkg_configure() {
	./configure --prefix="$DIFAS_PREFIX/$PACKAGE" --with-zlib=$ZLIB_PKG
}
