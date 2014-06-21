class ApnsClient::Frame::Item
  attr_accessor :id, :data

  def self.device_token(device_token)
    raise "Device token must be 32 bytes" unless device_token.bytesize == 32

    new(1, device_token)
  end

  def self.payload(payload)
    new(2, JSON.generate(payload))
  end

  def self.notification_identifier(notification_identifier)
    new(3, [ notification_identifier ].pack("N"))
  end

  def self.expiration_date(expiration_date)
    new(4, [ expiration_date.to_i ].pack("N"))
  end

  def self.priority(priority)
    priority_number = case priority
    when :immediate
      10
    when :power_conserving
      5
    else
      raise "Unsupported priority"
    end

    new(5, [ priority_number ].pack("c"))
  end

  def initialize(id, data)
    @id = id
    @data = data
  end

  def pack
    [ @id, @data.bytesize, @data ].pack("cna*")
  end
end
