# == Node: opsview::apt_repo
#
# Apt repo for opsview
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
#  include opsview_server::apt_repo
#
# === Authors
#
# Peter Souter
#
# === Copyright
#
#
#
class opsview_server::apt_repo {

  exec {'add-keys':
    command => 'gpg --keyserver subkeys.pgp.net --recv-key 0FC6984B',
  }

  apt::source { 'opsview':
    location    => "http://downloads.opsview.com/opsview-core/latest/apt/dists/$::lsbdistcodename/",
    include_src => true,
    require     =>  Exec["add-keys"],
  }

}