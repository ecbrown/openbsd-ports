# $OpenBSD: lua.port.mk,v 1.8 2012/05/11 20:48:38 jasper Exp $

CATEGORIES+=	lang/lua

# Major.Minor of current lua version provided by lang/lua
MODLUA_VERSION=	5.1

# Where the lua libraries will be installed to
MODLUA_LIBDIR=	${PREFIX}/lib/lua/${MODLUA_VERSION}/

# Where the lua modules will be installed to
MODLUA_DATADIR=	${PREFIX}/share/lua/${MODLUA_VERSION}/

MODLUA_RUNDEP?=	Yes
.if ${MODLUA_RUNDEP:L} == yes
RUN_DEPENDS+=	lang/lua
.endif

.if ${NO_BUILD:L} == "no"
BUILD_DEPENDS+=	lang/lua
.endif

.if !defined(SHARED_ONLY) || ${SHARED_ONLY:L} == "no"
PKG_ARCH=*
.endif

SUBST_VARS+=	MODLUA_VERSION
