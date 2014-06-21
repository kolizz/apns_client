class ApnsClient::UnregisteredDevice
  attr_accessor :device_token, :detected_unregistered

  def self.unpack(data)
    timestamp, token_length, device_token = data.unpack('NnH*')
    raise "Invalid feedback response" if device_token.bytesize != token_length

    new(device_token, Time.at(timestamp))
  end

  def initialize(device_token, detected_unregistered)
    @device_token = device_token
    @detected_unregistered = detected_unregistered
  end
end
