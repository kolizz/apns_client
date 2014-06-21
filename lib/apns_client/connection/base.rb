require 'socket'
require 'openssl'

class ApnsClient::Connection::Base
  attr_reader :host, :port, :certificate, :passphrase

  def initialize(host, port, certificate, passphrase = nil)
    @host = host
    @port = port
    @certificate = certificate
    @passphrase = passphrase
  end

  def open
    @transport = TCPSocket.new(@host, @port)

    context = OpenSSL::SSL::SSLContext.new
    context.key = OpenSSL::PKey::RSA.new(@certificate, @passphrase)
    context.cert = OpenSSL::X509::Certificate.new(@certificate)

    @socket = OpenSSL::SSL::SSLSocket.new(@transport, context)
    @socket.sync = true
    @socket.connect
  end

  def close
    @socket.close
    @transport.close
  end
end
