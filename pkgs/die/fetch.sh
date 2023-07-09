{% extends 'base.sh' %}

{% set git_sha %}{% block git_sha %}{% endblock %}{% endset %}

{% set git_repo %}
{% block git_repo %}
{% endblock %}
{% endset %}

{% set git_branch %}
{% block git_branch %}
{% endblock %}
{% endset %}

{% set git_commit %}
{% block git_commit %}
{% endblock %}
{% endset %}

{% block bld_deps %}
{% if git_sha %}
bld/stable/unpack
{% endif %}
{{super()}}
{% endblock %}

{% block bld_data %}
{% if git_sha %}
aux/git(parent_id=src_{{git_sha.strip()}},sha={{git_sha.strip()}},branch={{git_branch.strip()}},repo={{git_repo.strip()}},commit={{git_commit.strip()}})
{% endif %}
{{super()}}
{% endblock %}

{% block step_unpack %}
{% if git_sha %}
mkdir src
cd src
stable_unpack ${src}/*lz4
{% else %}{{super()}}{% endif %}
{% endblock %}