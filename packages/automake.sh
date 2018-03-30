NAME="automake"
VERSION="1.15"
PACKAGE="$NAME-$VERSION"

FILE="$PACKAGE.tar.xz"
URL="https://ftp.gnu.org/gnu/automake/$FILE"
SHA256SUM="9908c75aabd49d13661d6dcb1bc382252d22cc77bf733a2d55e87f2aa2db8636"

DEPENDS="autoconf"

export PATH="$(get_pkg_path autoconf)/bin:$PATH"
