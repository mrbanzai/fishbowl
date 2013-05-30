require 'nokogiri'
require 'fishbowl/errors'

module Fishbowl::Requests

  class BaseRequest

    attr_reader :ticket, :status_code, :status_message

    def initialize(attributes = {})
      attributes.map { |k, v| public_send("#{k}=", v) }
    end

    def compose
      nil
    end

    def parse_response(response_doc)
      @ticket = response_doc.at_xpath('//Ticket')

      response_node = response_doc.at_xpath('//FbiMsgsRs')
      check_response(response_node)
      if specific_response_node = response_node.at_xpath('*')
        check_response(specific_response_node)
      end

      [@status_code, @status_message, @ticket, distill(response_doc)]
    end

  protected

    def envelope(request)
      Nokogiri::XML::Builder.new do |xml|
        xml.FbiXml {
          # this hints that we can combine multiple requests in
          # a single envelope, but that use case isn't currently
          # supported
          xml.FbiMsgsRq {
            if request.respond_to?(:to_xml)
              xml << request.doc.xpath("request/*").to_xml
            else
              xml.send(request.to_s)
            end
          }
        }
      end
    end

    def distill(response_doc)
      nil
    end

    def check_response(node)
      @status_code = node.attr('statusCode')
      @status_message = node.attr('statusMessage')

      Fishbowl::Errors.confirm_success_or_raise(@status_code, @status_message)
    end

  end

end
