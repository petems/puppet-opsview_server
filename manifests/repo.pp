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
class opsview_server::repo {

  file { '/etc/yum.repos.d/opsview.repo':
    source  => 'puppet:///modules/opsview_server/opsview.repo',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Exec['yum-update']
  }

}


