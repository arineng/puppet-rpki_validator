# == Class: rpki_validator::install
#
# Installs the RIPE NCC RPKI Validator
#
# === Parameters
#
# [*download_url*]
#   The full URL path required to download the .tar.gz RPKI validator package
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
class rpki_validator::install(
  $download_url = $rpki_validator::download_url,
) {

  include stdlib

  $url_filename = url_parse($download_url,'filename')
  $package_dir = delete($url_filename, '-dist.tar.gz')

  archive { "/tmp/${url_filename}":
    ensure       => present,
    source       => $download_url,
    extract      => true,
    extract_path => '/opt',
    creates      => "/opt/${package_dir}",
    cleanup      => true,
  }

}
