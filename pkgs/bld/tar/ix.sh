{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/bsdtar/lite(std_box=bld/boot/box)
{% endblock %}
