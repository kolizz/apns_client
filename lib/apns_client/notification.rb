class ApnsClient::Notification
  attr_accessor :id, :device_token, :alert, :sound, :badge, :category, :expiration_date, :priority

  def initialize(id, device_token, options = {})
    @id = id
    @device_token = device_token
    @alert = options.delete(:alert)
    @sound = options.delete(:sound)
    @badge = options.delete(:badge)
    @category = options.delete(:category)
    @expiration_date = options.delete(:expiration_date)
    @priority = options.delete(:priority)
  end

  def to_frame
    items = []

    items << ApnsClient::Frame::Item.notification_identifier(@id) if @id != nil
    items << ApnsClient::Frame::Item.device_token(@device_token) if @device_token != nil
    items << ApnsClient::Frame::Item.expiration_date(@expiration_date) if @expiration_date != nil
    items << ApnsClient::Frame::Item.priority(@priority) if @priority != nil

    payload = { aps: { } }
    payload[:aps][:alert] = @alert if @alert != nil
    payload[:aps][:sound] = @sound if @sound != nil
    payload[:aps][:badge] = @badge if @badge != nil
    payload[:aps][:category] = @category if @category != nil

    items << ApnsClient::Frame::Item.payload(payload)

    ApnsClient::Frame::Frame.new(:notification, items)
  end
end
