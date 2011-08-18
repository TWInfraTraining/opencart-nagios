class nagios::server( $nagios_admin, $nagios_password, $web_hosts = ["web.part2.com"], $database_hosts = ["db.part2.com"], $db_username = "opencart", $db_name = "opencart", $db_password = "openpass", $pager_sms_number = "+1123...7890" ) {

  package { 'nagios3':
    alias => 'nagios',
    ensure => installed,
  }

  # delete the default debian configuration except localhost_nagios2.cfg
  file {
    [ '/etc/nagios3/conf.d/extinfo_nagios2.cfg',
      '/etc/nagios3/conf.d/contacts_nagios2.cfg',
      '/etc/nagios3/conf.d/generic-host_nagios2.cfg',
      '/etc/nagios3/conf.d/generic-service_nagios2.cfg',
      '/etc/nagios3/conf.d/hostgroups_nagios2.cfg',
      '/etc/nagios3/conf.d/services_nagios2.cfg',
      '/etc/nagios3/conf.d/stack_servers.cfg',
      '/etc/nagios3/conf.d/timeperiods_nagios2.cfg' ] :
        ensure => absent,
        require => Package['nagios'],
        notify => Service['nagios'],
  }


  file { '/etc/nagios3/conf.d/templates.cfg':
    content => template('nagios/etc/nagios3/conf.d/templates.cfg'),
    require => Package['nagios'],
    notify => Service['nagios'],
  }

  file { '/etc/nagios3/conf.d/notification.cfg':
    content => template('nagios/etc/nagios3/conf.d/notification.cfg'),
    require => Package['nagios'],
    notify => Service['nagios'],
  }

  file { '/etc/nagios3/conf.d/opencart.cfg':
    content => template('nagios/etc/nagios3/conf.d/opencart.cfg'),
    require => Package['nagios'],
    notify => Service['nagios'],
  }

  service { 'nagios3':
    alias => 'nagios',
    enable => true,
    ensure => running,
    hasrestart => true,
    hasstatus => true,
    require => Package['nagios'],
  }

  exec { 'create-nagios-userfile':
    creates => '/etc/nagios3/htpasswd.users',
    command => "htpasswd -bc /etc/nagios3/htpasswd.users $nagios_admin $nagios_password",
    path => '/usr/bin/',
    require => Package['nagios'],
  }
}
