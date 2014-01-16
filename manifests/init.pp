# == Node: opsview_server
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
#  include opsview_server
#
# === Authors
#
# Peter Souterrequire 'rest_client'
#
# === Copyright
#
#
#
class opsview_server inherits opsview_server::params {

  include opsview_server::package, opsview_server::config, opsview_server::service

  Class['opsview_server::package'] -> Class['opsview_server::config'] -> Class['opsview_server::service']

}
