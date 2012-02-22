import "cucumber"
import "nagios"
import "twilio"

include twilio
include nagios::cucumber

class { 'nagios::server':
  nagios_admin => "nagiosadmin",
  nagios_password => "nagiospwd",
}

class { 'nagios::twilio':
  send_from => 'YOUR PHONE NUMBER',
  account_sid => 'YOUR TWILIO ACCOUNT SID',
  account_token => 'YOUR TWILIO ACCOUNT TOKEN'
}
