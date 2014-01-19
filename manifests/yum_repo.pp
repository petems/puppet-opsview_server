# == Node: opsview
#
# Yum repo for opsview
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
#  include opsview_server::yum_repo
#
# === Authors
#
# Peter Souter
#
# === Copyright
#
#
#
class opsview_server::yum_repo {

  file { '/etc/yum.repos.d/opsview.repo':
    source  => 'puppet:///modules/opsview_server/opsview.repo',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  File['/etc/yum.repos.d/opsview.repo'] -> Exec['yum-update']

}


