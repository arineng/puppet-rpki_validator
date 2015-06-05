# == Class: rpki_validator::tal
#
# Create .tal files for use with the RPKI Validator
#
# === Parameters
#
# [*ca_name8}
#   ca.name field in the tal
# [*certificate_location*]
#   certificate.location field in the tal
# [*public_key_info*]
#   public.key.info field in the tal
# [*prefetch_uris*]
#   prefetch.uris field in the tal
#
# For more information see https://github.com/RIPE-NCC/rpki-validator/blob/master/rpki-validator-app/README.txt
#
# === Examples
#
# rpki_validator::tal { 'arin.tal':
#   ca_name              => 'ARIN RPKI Root',
#   certificate_location => 'rsync://rpki.arin.net/repository/arin-rpki-ta.cer',
#   public_key_info      => 'MIIBI....',
#   prefetch_uris        => 'rsync://rpki.arin.net/repository/',
# }
# 
# === Authors
#
# Steven Bambling <smbambling@arin.net>
#
# === Copyright
#
# Copyright 2015
#
define rpki_validator::tal (
  $ca_name              = undef,
  $certificate_location = undef,
  $public_key_info      = undef,
  $prefetch_uris        = undef,
) {

  include rpki_validator::restart

  file { "/opt/${rpki_validator::install::package_dir}/conf/tal/${name}":
    ensure  => file,
    content => template('rpki_validator/tal.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    notify  => [ Class["rpki_validator::restart"], ],
  }
}
