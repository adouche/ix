{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/binutils/binutils-2.37.tar.xz
e78d9ff2976b745a348f4c1f27c77cb1
{% endblock %}

{% block bld_libs %}
lib/z/mix.sh
lib/c++/mix.sh
lib/intl/mix.sh
{% endblock %}

{% block bld_tool %}
dev/lang/flex/mix.sh
dev/lang/bison/3/6/mix.sh
{% endblock %}

{% block configure_flags %}
--disable-werror
--disable-plugins
--with-system-zlib
--enable-deterministic-archives
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
export acx_cv_cc_gcc_supports_ada=no
{% endblock %}

{% block setup_gnu_cross %}
export ac_cv_build="{{host.gnu.four}}"
export ac_cv_host="{{target.gnu.four}}"
export ac_cv_target="{{for_target or target.gnu.four}}"
{% endblock %}
