# Copyright 2024 Fabio Scaccabarozzi
# Distributed under the terms of the GNU General Public License v3

# Auto-Generated by cargo-ebuild 0.5.4

EAPI=8

inherit cosmic-de desktop

DESCRIPTION="app library for COSMIC DE"
HOMEPAGE="https://github.com/pop-os/$PN"

if [ "${PV}" == "9999" ]; then
	EGIT_REPO_URI="${HOMEPAGE}"
	EGIT_COMMIT=3349462
else
	# TODO this is not really working atm
	SRC_URI="https://github.com/pop-os/${PN}/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.tar.gz
				$(cargo_crate_uris)
"
fi

# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

# As per https://raw.githubusercontent.com/pop-os/cosmic-applibrary/master/debian/control
DEPEND="${DEPEND}"
BDEPEND="${BDEPEND}"
RDEPEND="${RDEPEND}"

src_install() {
	# One of the few where $PN does not apply (would be cosmic-applibrary)
	dobin "target/$profile_name/cosmic-app-library"
	
	domenu data/com.system76.CosmicAppLibrary.desktop

	cosmic-de_install_metainfo data/com.system76.CosmicAppLibrary.metainfo.xml

	insinto /usr/share/icons/hicolor/scalable/apps
	doins data/icons/com.system76.CosmicAppLibrary.svg
}
