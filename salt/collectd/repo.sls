{% if grains['osrelease'] is matching('^7\..*') -%}
debmon-repo:
  pkgrepo.managed:
    - humanname: Debmon Repo for Icinga
    - name: deb http://debmon.org/debmon debmon-wheezy main
    - file: /etc/apt/sources.list.d/debmon.list
    - key_url: http://debmon.org/debmon/repo.key

{% else %}

debmon-repo:
  pkgrepo.managed:
    - humanname: Debmon Repo for Icinga
    - name: deb http://debmon.org/debmon debmon-squeeze main
    - file: /etc/apt/sources.list.d/debmon.list
    - key_url: http://debmon.org/debmon/repo.key

{% endif %}
