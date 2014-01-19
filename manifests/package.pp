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

  package { 'opsview':
    ensure  => latest,
  }

}
