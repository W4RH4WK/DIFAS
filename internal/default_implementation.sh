# This file contains the default implementation for install steps.

pkg_download() {
	wget -O "$FILE" "$URL"
	if [[ -n "$SHA256SUM" ]]; then
		echo "$SHA256SUM  $FILE" | sha256sum -c
	fi
}

pkg_extract() {
	tar xf "$FILE"
}

pkg_prepare() {
	find "$INSTALLER_DIR/patches" -name "$NAME-*.patch" \
	| sort \
	| xargs -r -L 1 patch -p1 -N -i
}

pkg_configure() {
	./configure --prefix="$DIFAS_PREFIX/$PACKAGE"
}

pkg_build() {
	make -j "$SLOTS"
}

pkg_check() {
	true
}

pkg_install() {
	make install
}

pkg_install_done() {
	touch "$DIFAS_PREFIX/$PACKAGE/.installed"
}

pkg_cleanup() {
	rm -rf "$PACKAGE" "$FILE"
}
