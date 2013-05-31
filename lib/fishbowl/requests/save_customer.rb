require 'nokogiri'
require 'fishbowl/objects/customer'
require 'fishbowl/requests/base_request'

module Fishbowl::Requests

  class SaveCustomer < BaseRequest

    attr_accessor :customer

    def compose
      validate
      envelope(Nokogiri::XML::Builder.new do |xml|
        xml.request {
          xml.CustomerSaveRq {
            xml << @customer.to_xml.to_xml
          }
        }
      end)
    end

  protected

    def validate
      raise 'Missing field: customer' if @customer.nil?
      raise 'customer must be a Customer object' if !@customer.is_a?(Fishbowl::Objects::Customer)
    end

    def distill(response_doc)
    end

  end

end
