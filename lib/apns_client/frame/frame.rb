class ApnsClient::Frame::Frame
  attr_accessor :command, :items

  def initialize(command, items = [])
    @command = command
    @items = items
  end

  def pack
    data = @items.map(&:pack).join

    [ command_number(@command), data.bytesize, data ].pack("cNa*")
  end

  private

  def command_number(command)
    case command
    when :notification
      2
    end
  end
end
