COMMENT =		authoritative DNS server

# update net/py-libknot when updating this
DISTNAME =		knot-3.3.9

SHARED_LIBS +=	dnssec               3.1      # .9.0
SHARED_LIBS +=	knot                 10.0     # .14.0
SHARED_LIBS +=	zscanner             1.1      # .4.0

CATEGORIES =		net

HOMEPAGE =		https://www.knot-dns.cz/

MAINTAINER =		Aisha Tammy <aisha@openbsd.org>

# GPLv3+
PERMIT_PACKAGE =	Yes

WANTLIB += c curses edit gmp gnutls hogweed iconv idn2 intl
WANTLIB += lmdb m nettle nghttp2 p11-kit pthread tasn1 unistring urcu
WANTLIB += urcu-common brotlidec brotlienc z zstd

SITES =			https://secure.nic.cz/files/knot-dns/
EXTRACT_SUFX =		.tar.xz

DEBUG_PACKAGES =	${BUILD_PACKAGES}

# atomics
COMPILER =		base-clang ports-gcc
COMPILER_LANGS =	c

BUILD_DEPENDS =		devel/bison
LIB_DEPENDS =		devel/gettext,-runtime \
			devel/libidn2 \
			devel/liburcu \
			security/gnutls \
			databases/lmdb \
			www/nghttp2

CONFIGURE_STYLE =	gnu
CONFIGURE_ARGS +=	--with-storage=${LOCALSTATEDIR}/db/knot \
			--with-libidn \
			--enable-quic=embedded \
			--disable-dnstap \
			--disable-maxminddb

CONFIGURE_ENV =		ac_cv_path_PDFLATEX="false" \
			ac_cv_path_SPHINXBUILD="false" \
			CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib ${LDFLAGS}"

post-install:
	mv ${WRKINST}/etc/knot/ ${PREFIX}/share/examples/knot/

.include <bsd.port.mk>

.if ${CHOSEN_COMPILER} == "ports-gcc"
# gcc-8.3.0 uses too much memory to build the fast zone parser
# (at least on sparc64)
CONFIGURE_ARGS +=	--disable-fastparser
.else
# Old clang versions choked when building the fast zone parser,
# force-enable it here.
CONFIGURE_ARGS +=	--enable-fastparser=force
.endif
