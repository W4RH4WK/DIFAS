NAME="cmake"
VERSION="3.10.3"
PACKAGE="$NAME-$VERSION"

FILE="$PACKAGE.tar.gz"
URL="https://cmake.org/files/v$(echo $VERSION | cut -f1,2 -d.)/$FILE"
SHA256SUM="0c3a1dcf0be03e40cf4f341dda79c96ffb6c35ae35f2f911845b72dab3559cf8"

pkg_configure() {
	LDFLAGS="-O3" ./configure --prefix="$DIFAS_PREFIX/$PACKAGE"
}
