{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/hyprwm/Hyprland/releases/download/v0.24.0/source-v0.24.0.tar.gz
sha:43232560c07ca032ce2041c8863662e81d9a493574e81de1c0ad01ceee444af3
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/pango
lib/cairo
lib/input
lib/udis86
lib/opengl
lib/wayland
lib/shim/x11
lib/xkbcommon
lib/drivers/3d
lib/wlroots/17
lib/mesa/gl/dl
lib/mesa/egl/dl
lib/range/v3/std
lib/mesa/glesv2/dl
{% endblock %}

{% block bld_tool %}
bin/jq
bld/fakegit
bld/wayland
{% endblock %}

{% block patch %}
sed -e 's|.*define PI .*||' -i src/defines.hpp
sed -e 's|PI |M_PI |g' -i src/config/ConfigManager.cpp
sed -e 's|PI |M_PI |g' -i src/render/OpenGL.cpp

sed -e "s|subproject.*wlroots.*|dependency('wlroots')|" \
    -e 's|have_xwlr = .*|have_xwlr = false|' \
    -i meson.build

sed -e 's|.get_variable.*wlroots.*|,|' \
    -i src/meson.build

sed -e 's|.*Running on WAYLAND_DISPLAY.*||' -i src/Compositor.cpp
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/share/pkgconfig
{% endblock %}