# == Node: opsview
#
#  Params for OS specific settings
#
# === Parameters
#
#
#
# === Variables
#
#
# === Examples
#
#  na
#
# === Authors
#
# Peter Souter
#
class opsview_server::params {

  if ! defined(Package['mysql']) {
    package { 'mysql': }
  }

  if ! defined(Package['mysql-server']) {
    package { 'mysql-server': }
  }

  if ! defined(Package['libmcrypt']) {
    package { 'libmcrypt': }
  }

  if ! defined(Service['mysqld']) {
    service {'mysqld':
      ensure => running,
    }
  }

  case $::osfamily {
    'RedHat': {
      include epel
      include opsview_server::yum_repo

      exec { 'yum-update':
        command => 'yum update -y',
        timeout => '1800',
      }

    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}