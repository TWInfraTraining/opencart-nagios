class nagios::twilio( $account_sid, $account_token, $send_from, $api_version = '2010-04-01') {
  # send_from should be in +1[areacode][phonenumber] format. For example +13123731000
  
  file { '/usr/local/bin/nagios_twilio_sms.py':
    content => template('nagios/usr/local/bin/nagios_twilio_sms.py'),
    mode => 755,
  }
}
