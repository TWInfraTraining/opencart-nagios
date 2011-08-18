#!/usr/bin/env python

import sys
from twilio.rest import TwilioRestClient

API_VERSION = <%= api_version %>
ACCOUNT_SID = <%= account_sid %>
ACCOUNT_TOKEN = <%= account_token %>
SEND_FROM = <%= send_from %>

client = TwilioRestClient(ACCOUNT_SID, ACCOUNT_TOKEN)

def notify(send_to, notification_type, service, host, service_state, last_checked):
    message = '%s - %s/%s is %s - checked at %s' % (notification_type, host, service, servicestate, lastchecked)
    return client.sms.messages.create(to=send_to, from_=SEND_FROM, body=message)

if __name__ == "__main__":
    send_to = sys.argv[1]
    notification_type = sys.argv[2]
    service = sys.argv[3]
    host = sys.argv[4]
    service_state = sys.argv[5]
    last_checked = ' '.join(sys.argv[6:])

    notify(send_to, notification_type, service_state, host, service_state, last_checked)
