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

  Exec {
    path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    logoutput=>on_failure,
  }

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
      include opsview_server::repo

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