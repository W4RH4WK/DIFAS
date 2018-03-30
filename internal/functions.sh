# Loads a given package file into the current shell.
load_pkg() {
	local name=$1
	source "$INSTALLER_DIR/packages/$1.sh"
}

# Get a list of all available packages.
get_pkg_list() {
	find "$INSTALLER_DIR/packages" -type f -exec basename -s .sh {} \; \
	| sort
}

# Returns a property defined in a given package file.
get_pkg_property() {
	local name=$1
	local property=$2
	(
		load_pkg $name
		eval "echo \$$property"
	)
}

# Returns the installation path of a pacakge, assuming it is installed.
get_pkg_path() {
	local name=$1
	echo "$DIFAS_PREFIX/$(get_pkg_property $name PACKAGE)"
}

# Indicates whether the given package is installed.
is_pkg_installed() {
	local name=$1
	(
		load_pkg $name
		[[ -f "$DIFAS_PREFIX/$PACKAGE/.installed" ]]
	)
}

# Aborts if no package with the given name is found.
assert_pkg_exists() {
	local name=$1
	if [[ ! -f "$INSTALLER_DIR/packages/$name.sh" ]]; then
		>&2 echo "Error: No file packages/$name.sh found."
		exit 1
	fi
}

# Gets all dependencies of the given packages.
resolve_dependencies() {
	local names=$@
	for pkg in $names; do
		resolve_dependencies_for_pkg "$pkg"
	done \
	| awk '!unique[$_]++'
}

# Recursively get dependencies of the given package.
resolve_dependencies_for_pkg() {
	local name=$1
	for pkg in $(get_pkg_property $name DEPENDS); do
		resolve_dependencies_for_pkg "$pkg"
	done
	echo "$name"
}
