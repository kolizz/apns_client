## APNs client

apns_client is a client for Apple Push Notification service. It features error reporting and an API without magic
processing of the device token for when the actual binary token is around.

**The project is incomplete and should not be used in production in its current form**

### Getting started

```ruby
    gem 'apns_client', git: 'https://github.com/kolizz/apns_client.git'
```
 
### Usage

```ruby
    # Create client.
    client = ApnsClient::Client.new("gateway.sandbox.push.apple.com", "feedback.sandbox.push.apple.com", File.read("path/to/certificate.pem")))   
    
    # Create notification. First argument is an arbitrary notification id. Device token is the binary string from iOS/OS X.
    notification = ApnsClient::Notification.new(1, device_token, alert: "hello world")
    
    # Send it
    client.send(notification)
```

### License

MIT license. See LICENSE for more information.
