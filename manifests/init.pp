# == Class: rpki_validator
#
# Installs and Configures the RIPE NCC RPKI Validator
#
# === Parameters
#
# [*download_url*]
#   The full URL path required to download the .tar.gz RPKI validator package
#
# [*jetty_web_port*]
#   The port you want Jetty to listen on for the RPKI Validator
#
# === Examples
#
# class { 'rpki_validator':
#   download_url   => 'https://lirportal.ripe.net/certification/content/static/validator/rpki-validator-app-2.20-dist.tar.gz',
#   jetty_web_port => 8081,
# } -> 
#
# === Authors
#
# Steven Bambling <smbambling@arin.net>
#
# === Copyright
#
# Copyright 2015 
#
class rpki_validator (
  $download_url   = $rpki_validator::params::download_url,
  $jetty_web_port = $rpki_validator::params::jetty_web_port,
) inherits rpki_validator::params {

  anchor { 'rpki_validator::start': }
  anchor { 'rpki_validator::end': }

  Anchor['rpki_validator::start'] ->
  class { 'rpki_validator::install':
    download_url => $download_url,
  } ->
  class { 'rpki_validator::config': 
    jetty_web_port => $jetty_web_port,
  } ->  
  class { 'rpki_validator::service': } ->
  Anchor['rpki_validator::end']
}
