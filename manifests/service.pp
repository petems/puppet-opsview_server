# == Node: opsview
#
#  Puppet setup for the opsview monitoring tool
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
# Peter Souterrequire 'rest_client'
#
# === Copyright
#
#
#
class opsview_server::service {

  service { 'opsview-web':
    ensure => running,
    enable => true,
  }

}
