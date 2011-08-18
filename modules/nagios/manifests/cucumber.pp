class nagios::cucumber {
  package { 'cucumber-nagios':
    ensure => installed,
    provider => gem,
    require => Package['cucumber'],
  }

  file { '/etc/nagios3/conf.d/cucumber-nagios.cfg':
    content => template('nagios/etc/nagios3/conf.d/cucumber-nagios.cfg'),
    require => Package['nagios'],
    notify => Service['nagios'],
  }

  file { "/usr/local/bin/cucumber-nagios":
    ensure => link,
    target => "/var/lib/gems/1.8/bin/cucumber-nagios",
    require => Package['cucumber-nagios'],
  }
}

