{% extends '//bin/clang/t/t/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/16/ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/zstd
{{super()}}
{% endblock %}

{% block llvm_targets %}
lld
{% endblock %}

{% block patches %}
ctors-in-init-array.patch
#prefer-static.patch
revert-25da87-fix-cuda10.patch
{% endblock %}

{% block patch %}
{{super()}}
cd lld
{% for x in ix.parse_list(self.patches()) %}
echo 'apply {{x}}'
base64 -d << EOF | patch -p1
{{ix.load_file('patches/' + x) | b64e}}
EOF
{% endfor %}
{% endblock %}
