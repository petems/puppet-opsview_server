# == Node: opsview::config
#
#  Database configuration for opsview
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
# include opsview::config
#
# === Authors
#
# Peter Souterrequire 'rest_client'
#
# === Copyright
#
#
#
class opsview_server::config {

  $opsview_db_password = 'password'

  # TO DO: Clean this up, improve onlyif statements.

  exec { 'set-root-mysql-password':
    command => "mysqladmin -u root password ${opsview_db_password}",
    onlyif  => [
    "mysql -u root -p'${opsview_db_password}' -e 'show databases;' 2>&1 | grep 'Access denied'",
  ],
  } ->

  exec { 'create-nagios-database':
    provider => shell,
    command  => "/usr/local/nagios/bin/db_mysql -u root -p ${opsview_db_password}",
    onlyif   => [
    "if mysql -u root -p'${opsview_db_password}' -e 'SELECT distinct User FROM mysql.user;' | grep 'opsview' ; then
      exit 1
    else
      exit 0
    fi"
  ]
  }
  ->

  exec { 'opsview-db-install':
    command  => '/usr/local/nagios/bin/db_opsview db_install',
    provider => shell,
    onlyif   => [
    "if mysql -u root -p'${opsview_db_password}' -e 'SELECT distinct name FROM opsview.monitoringservers' | grep 'Master Monitoring Server' ; then
      exit 1
    else
      exit 0
    fi"
  ]
  }
  ->

  exec { 'opsview-runtime-install':
    command  => '/usr/local/nagios/bin/db_runtime db_install',
    provider => shell,
    onlyif   => [
    "if mysql -u root -p'${opsview_db_password}' -e 'SELECT distinct name FROM runtime.opsview_hostgroups' | grep 'Opsview' ; then
      exit 1
    else
      exit 0
    fi"
  ]
  }
  ->

  file { '/var/log/opsview/opsviewd.log':
    owner   => 'nagios',
    group   => 'nagios',
    mode    => '0644',
  }
  ->

  exec { 'opsview-genconfig':
    command => '/usr/local/nagios/bin/rc.opsview gen_config',
  }

}
