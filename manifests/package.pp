# == Node: opsview::package
#
# Package setup for opsview
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
#  include opsview::package
#
# === Authors
#
# Peter Souterrequire 'rest_client'
#
# === Copyright
#
#
#
class opsview_server::package {

  include opsview_server::repo

  package { 'opsview':
    before  => Exec['yum-update'],
    ensure  => latest,
    require => File['/etc/yum.repos.d/opsview.repo']
  }

}
