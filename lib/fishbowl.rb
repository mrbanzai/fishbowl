
require 'socket'
require 'digest'

require 'fishbowl/ext'

module Fishbowl # :nodoc:

  # to avoid complains about the top-level module
  # not existing, these are required inside the
  # module
  require 'fishbowl/errors'
  require 'fishbowl/requests'
  require 'fishbowl/version'
  require 'fishbowl/objects'

  class Connection

    attr_accessor :host, :port, :username, :password
    attr_reader :last_request, :last_response

    @connection = nil
    @ticket = nil

    def initialize(options = {})
      raise Fishbowl::Errors::MissingHost if options[:host].nil?

      @host = options[:host]
      @port = options[:port] || 28192
    end

    def connect
      @connection = TCPSocket.new @host, @port
      self
    end

    def connected?
      !!@connection
    end

    def login(username, password)
      raise Fishbowl::Errors::ConnectionNotEstablished if !connected?
      raise Fishbowl::Errors::MissingUsername if username.nil?
      raise Fishbowl::Errors::MissingPassword if password.nil?

      @username, @password = username, password

      login_request = Fishbowl::Requests::Login.new(
        :username => username,
        :password => password
      )

      response = send_request(login_request)

      self
    end

    def send_request(request)
      request_builder = request.compose
      attach_ticket(request_builder)

      @last_request = request_builder.doc
      @last_response = nil

      write(request_builder)
      get_response(request)
    end

    def close
      @connection.close if @connection
      @connection = nil
      self
    end

    # Create utility proxies to requests, eg., will add method "add_inventory"
    # that builds and sends a Fishbowl::Requests::AddInventory
    Fishbowl::Requests.constants.each do |c|
      module_constant = Fishbowl::Requests.const_get(c)
      method_name = c.to_s.underscore.to_sym
      if module_constant.is_a?(Class) && !self.method_defined?(method_name)
        define_method method_name do |attributes = {}|
          request = module_constant.new(attributes)
          send_request(request)
        end
      end
    end

  private

    # This is kind of awkward, as we're adding the ticket into
    # the request from within the connection - would it be
    # better to make it a static property on the base request?
    # Or inject it to every `build` call?
    #
    # Not sure if the additional ticket information is required
    # on later calls (user ID, etc.)
    def attach_ticket(request_builder)
      if @ticket.nil?
        @ticket = Nokogiri::XML::Node.new('Ticket', request_builder.doc)
      end

      node = request_builder.doc.xpath('//FbiXml/*').first
      node.add_previous_sibling(@ticket)

      request_builder
    end

    def write(request_builder)
      body = request_builder.to_xml
      size = [body.size].pack("N")

      @connection.write(size)
      @connection.write(body)
    end

    def get_response(request)
      length = @connection.read(4).unpack('N').join('').to_i
      response_doc = Nokogiri::XML.parse(@connection.read(length))
      @last_response = response_doc

      _, _, @ticket, response = request.parse_response(response_doc)

      response
    end

  end
end
