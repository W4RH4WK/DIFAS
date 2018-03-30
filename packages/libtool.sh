NAME="libtool"
VERSION="2.4.5"
PACKAGE="$NAME-$VERSION"

FILE="$PACKAGE.tar.xz"
URL="https://ftp.gnu.org/gnu/libtool/$FILE"
SHA256SUM="84aac136513b009278896ffa255e4d685bcdb0cb0e5363be36adad64c986177e"

DEPENDS="autoconf automake"

export PATH="$(get_pkg_path autoconf)/bin:$PATH"
export PATH="$(get_pkg_path automake)/bin:$PATH"
