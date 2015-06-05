# == Class: rpki_validator::restart
#
# Manages the RIPE NCC RPKI Validator restart (Jetty)
#
# === Parameters
#
# === Examples
#
# === Authors
#
# Steven Bambling <smbambling@arin.net>
#
# === Copyright
#
# Copyright 2015
#
class rpki_validator::restart {

  # Not very fond of this, but there is no Service for this packaged deploy
  exec { 're stop rpki-validator':
    path        => [ "/opt/${rpki_validator::install::package_dir}", '/bin', '/usr/bin', '/usr/sbin', ],
    command     => 'rpki-validator.sh stop',
    refreshonly => true,
  } ->
  exec { 're start rpki-validator':
    path        => [ "/opt/${rpki_validator::install::package_dir}", '/bin', '/usr/bin', '/usr/sbin', ],
    command     => 'rpki-validator.sh start',
    onlyif      => 'rpki-validator.sh status | grep -q "not running"',
    refreshonly => true,
  }

}
