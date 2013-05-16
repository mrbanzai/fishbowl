require 'nokogiri'
require 'fishbowl/requests/base_request'
require 'fishbowl/objects/customer'

module Fishbowl::Requests

  class GetCustomer < BaseRequest
    attr_accessor :name

    def compose
      envelope(Nokogiri::XML::Builder.new do |xml|
        xml.request {
          xml.CustomerGetRq {
            xml.Name @name
          }
        }
      end)
    end

  protected

    def validate
      raise ArgumentError, 'Must provide customer name' unless @name
    end

    def distill(response_doc)
      response_doc.xpath('//Customer').map { |n| Fishbowl::Objects::Customer.from_xml(n) }
    end

  end

end
