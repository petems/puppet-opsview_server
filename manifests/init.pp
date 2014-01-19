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
class opsview_server {

  Exec {
    path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    logoutput=>on_failure,
  }

  include opsview_server::params

  include opsview_server::package, opsview_server::config, opsview_server::service

  Class['opsview_server::params'] -> Class['opsview_server::package']

  Class['opsview_server::package'] -> Class['opsview_server::config'] -> Class['opsview_server::service']

}
