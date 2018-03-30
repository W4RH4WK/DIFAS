# Default install location.
export DIFAS_PREFIX="${DIFAS_PREFIX:-$HOME/.difas}"

# Name of the third party directory.
export THIRD_PARTY_DIR="${THIRD_PARTY_DIR:-third_party}"

# Default compile flags.
export CFLAGS="${CFLAGS:-"-mtune=native -O3"}"
export CXXFLAGS="${CXXFLAGS:-"-mtune=native -O3"}"
export LDLAGS="${LDLAGS:-"-mtune=native -O3"}"

# Number of parallel jobs.
export SLOTS="${SLOTS:-$(nproc)}"

# Override Compiler.
if [[ -n ${DIFAS_USE_GCC+x} ]]; then
	GCC_PKG="$DIFAS_PREFIX/$(get_pkg_property gcc PACKAGE)"
	export CC="$GCC_PKG/bin/gcc"
	export CXX="$GCC_PKG/bin/g++"
	export PATH="$GCC_PKG/bin:$PATH"
	export LD_LIBRARY_PATH="$GCC_PKG/lib64"
fi
