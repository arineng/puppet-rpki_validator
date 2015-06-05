# == Class: rpki_validator::service
#
# Manages the RIPE NCC RPKI Validator service (Jetty)
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
class rpki_validator::service {

  # Just make sure the jetty service is started
  exec { 'start rpki-validator':
    path    => [ "/opt/${rpki_validator::install::package_dir}", '/bin', '/usr/bin', '/usr/sbin', ],
    command => 'rpki-validator.sh start',
    onlyif  => 'rpki-validator.sh status | grep -q "not running"',
  }

}
