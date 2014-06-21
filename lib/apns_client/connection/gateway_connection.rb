class ApnsClient::Connection::GatewayConnection < ApnsClient::Connection::Base
  def initialize(host, certificate, passphrase = nil)
    super(host, 2195, certificate, passphrase)
  end

  def send_frame(frame)
    @socket.write(frame.pack)

    # Waits a second for errors since APNs doesn't respond on successes and also doesn't
    # guarantee when the response may arrive. Reconnects since APNs will kill the
    # connection after an error.
    # TODO: It would be nice to not have to wait an arbitrary amount of time for errors
    read, _ = IO.select([ @socket ], nil, nil, 1)
    if read && read.length > 0
      error = ApnsClient::ErrorResponse.unpack(@socket.read(6))
      close
      open
      error
    end
  end
end
