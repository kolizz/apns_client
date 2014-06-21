class ApnsClient::ErrorResponse
  attr_reader :error, :notification_identifier

  def self.unpack(data)
    command, status_code, notification_identifier = data.unpack("CCN")

    raise "Unknown error response" unless command == 8

    status = case status_code
    when 0
      :no_error
    when 1
      :processing_error
    when 2
      :missing_device_token
    when 3
      :missing_topic
    when 4
      :missing_payload
    when 5
      :invalid_token_size
    when 6
      :invalid_topic_size
    when 7
      :invalid_payload_size
    when 8
      :invalid_token
    when 10
      :shutdown
    else
      raise "Unknown status code"
    end

    new(status, notification_identifier)
  end

  def initialize(error, notification_identifier)
    @error = error
    @notification_identifier = notification_identifier
  end
end
