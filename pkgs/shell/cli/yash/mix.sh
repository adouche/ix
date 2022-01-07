{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/magicant/yash/releases/download/2.51/yash-2.51.tar.xz
91d0c0fa548c9c9a081893f515b4f049
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
lib/edit
{% endblock %}

{% block c_rename_symbol %}
vfree
wordfree
add_history
{% endblock %}

{% block configure %}
dash configure --prefix="${out}" --with-term-lib=ncurses
{% endblock %}
