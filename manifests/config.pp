# == Class: rpki_validator::config
#
# Manages some RPKI validator settings 
# 
# (file: rpki-validator.conf)
#
# === Parameters
#
# [*jetty_web_port*]
#   The port you want Jetty to listen on for the RPKI Validator
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
class rpki_validator::config (
  $jetty_web_port = $rpki_validator::params::jetty_web_port
) inherits rpki_validator::params {

  # This is hacky and needs a better wrapper to manage all the options
  exec { 'set rpki-validator jetty web port':
    path    => ['/usr/bin', '/usr/sbin', '/bin'],
    command => "sed -i 's/8080/${jetty_web_port}/g' /opt/${rpki_validator::install::package_dir}/conf/rpki-validator.conf",
    unless  => "grep \"${jetty_web_port}\" /opt/${rpki_validator::install::package_dir}/conf/rpki-validator.conf",
  }

}
