class ApnsClient::Connection::FeedbackConnection < ApnsClient::Connection::Base
  def initialize(host, certificate, passphrase = nil)
    super(host, 2196, certificate, passphrase)
  end

  def unregistered_devices
    devices = []

    while line = @socket.read(38)
      devices << ApnsClient::UnregisteredDevice.unpack(line)
    end

    devices
  end
end
