# Copyright 2024 Fabio Scaccabarozzi
# Distributed under the terms of the GNU General Public License v3

# Auto-Generated by cargo-ebuild 0.5.4

EAPI=8

inherit cosmic-de

DESCRIPTION="compositor for COSMIC DE"
HOMEPAGE="https://github.com/pop-os/$PN"

if [ "${PV}" == "9999" ]; then
	EGIT_REPO_URI="${HOMEPAGE}"
	EGIT_COMMIT=5e61ce1
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

# As per https://raw.githubusercontent.com/pop-os/cosmic-comp/master/debian/control
DEPEND="
${DEPEND}
dev-libs/libinput
media-libs/fontconfig
media-libs/libglvnd
media-libs/mesa
sys-apps/systemd
sys-auth/seatd
virtual/libudev
x11-libs/libxcb
x11-libs/pixman
"
BDEPEND="
${BDEPEND}
dev-build/cmake
"
RDEPEND="
${RDEPEND}
dev-libs/wayland
media-libs/mesa
"

src_install() {
	dobin "target/$profile_name/$PN"
	
	insinto /etc/cosmic-comp
	doins config.ron
}
