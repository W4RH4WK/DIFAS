NAME="hdf5"
VERSION="1.8.20"
PACKAGE="$NAME-$VERSION"

FILE="$PACKAGE.tar.gz"
URL="https://support.hdfgroup.org/ftp/HDF5/current18/src/$FILE"
SHA256SUM="6ed660ccd2bc45aa808ea72e08f33cc64009e9dd4e3a372b53438b210312e8d9"

# Consider adding szip 2.1.1 and zlib
DEPENDS=""

export LD_RUN_PATH=""

pkg_configure() {
	./configure --prefix="$DIFAS_PREFIX/$PACKAGE" #--enable-parallel
}
