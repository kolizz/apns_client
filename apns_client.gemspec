Gem::Specification.new do |s|
  s.name        = 'apns_client'
  s.version     = '0.0.0'
  s.date        = '2014-06-21'
  s.summary     = 'APNs client'
  s.description = 'Ruby client for Apple Push Notification service'
  s.authors     = [ 'Stefan Lindbohm' ]
  s.email       = 'stefan@kolizz.com'
  s.files       = %w{lib/apns_client.rb lib/apns_client/connection/base.rb lib/apns_client/connection/gateway_connection.rb lib/apns_client/connection/feedback_connection.rb lib/apns_client/frame/frame.rb lib/apns_client/frame/item.rb lib/apns_client/client.rb lib/apns_client/error_response.rb lib/apns_client/notification.rb lib/apns_client/unregistered_device.rb}
  s.homepage    = 'http://github.com/kolizz/apns_client'
  s.license     = 'MIT'
end
