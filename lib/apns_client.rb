module ApnsClient; end
module ApnsClient::Connection; end
module ApnsClient::Frame; end

require 'apns_client/connection/base'
require 'apns_client/connection/gateway_connection'
require 'apns_client/connection/feedback_connection'
require 'apns_client/frame/frame'
require 'apns_client/frame/item'
require 'apns_client/client'
require 'apns_client/error_response'
require 'apns_client/notification'
require 'apns_client/unregistered_device'
