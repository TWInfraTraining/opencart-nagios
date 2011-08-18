# should probably switch to using
# package { 'twilio': ensure => installed, provider => 'pip' }
# in a new version of puppet that has pip as a built-in provider

class twilio {
  package { 'python-pip':
    ensure => installed,
  }

  exec { 'install-twilio':
    creates => '/usr/local/lib/python2.7/dist-packages/twilio',
    command => "pip install twilio",
    path => '/usr/bin/',
    require => Package['python-pip'],
  }
}
