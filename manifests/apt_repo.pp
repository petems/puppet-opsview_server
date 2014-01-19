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

  apt::source { 'opsview':
    location          => "http://downloads.opsview.com/opsview-core/latest/apt/dists/$::lsbdistcodename/",
    key               => '0FC6984B',
    key_server        => 'subkeys.pgp.net',
    pin               => '-10',
    include_src       => true
  }
}