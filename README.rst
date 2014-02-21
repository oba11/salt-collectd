========
salt-collectd
========

Collectd state for Saltstack.
This installs collectd and sends data to a graphite host.

Guide
-----

 .. code-block:: bash

  $ sudo git clone https://github.com/oba11/salt-collectd.git /srv
  $ sudo salt-call --local state.highstate

