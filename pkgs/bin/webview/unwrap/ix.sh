{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
lib/gtk/deps
lib/web/view
lib/web/kit/deps
lib/{{allocator}}/trim(delay=5,bytes=10000000)
{% endblock %}

{% bloak name %}
webview
{% endblock %}

{% block sources %}
webview.cpp
{% endblock %}

{% block install %}
{{super()}}
{% call hooks.wrap_xdg_binary('webview') %}
export WEBKIT_EXEC_PATH="\$(dirname \$(which WebKitWebProcess))"
{% endcall %}
{% endblock %}
