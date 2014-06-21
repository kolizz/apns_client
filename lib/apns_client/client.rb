class ApnsClient::Client
  def initialize(gateway_host, feedback_host, certificate, passphrase = nil)
    @gateway_connection = ApnsClient::Connection::GatewayConnection.new(gateway_host, certificate, passphrase)
    @feedback_connection = ApnsClient::Connection::FeedbackConnection.new(feedback_host, certificate, passphrase)

    @gateway_connection.open
  end

  def send(notification)
    @gateway_connection.send_frame(notification.to_frame)
  end

  def unregistered_devices
    @feedback_connection.open
    devices = @feedback_connection.unregistered_devices
    @feedback_connection.close

    devices
  end

  def disconnect
    @gateway_connection.close
  end
end
