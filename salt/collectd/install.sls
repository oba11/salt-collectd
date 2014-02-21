collectd:
  pkg.installed:
    {% if grains['osrelease'] is matching('^7.*') %}
    - fromrepo: debmon-wheezy
    {% else %}
    - fromrepo: debmon-squeeze
    {% endif %}
    - pkgs:
      - collectd
      - collectd-core
  service:
    - running
    - enable: True
    - watch:
      - file: collectd
    - require:
      - file: collectd
  file.managed:
    - name: /etc/collectd/collectd.conf
    - source: salt://templates/etc/collectd/collectd.conf
    - user: root
    - group: root
    - template: jinja
    - defaults:
      graphite_host: {{ pillar['config_graphite']['hosts']['master'] }}
    - require:
      - pkg: collectd
