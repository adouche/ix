{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir -p etc/services/unbound; cd etc/services/unbound

cat << EOF > unbound.conf
server:
    username: unbound
    logfile: "/var/run/unbound/unbound.log"

include: "/var/run/resolvconf/unbound.conf"
EOF

cat << EOF > run
#!/bin/sh
exec srv unbound unbound -d -p -v -c ${PWD}/unbound.conf
EOF

chmod +x run
{% endblock %}