require 'nokogiri'
require 'fishbowl/objects/sales_order'
require 'fishbowl/requests/base_request'

module Fishbowl::Requests

  class LoadSalesOrder < BaseRequest

    attr_accessor :number

    def compose
      validate
      envelope(Nokogiri::XML::Builder.new do |xml|
        xml.request {
          xml.LoadSORq {
            xml.Number @number
          }
        }
      end)
    end

  protected

    def validate
      raise 'Missing field: number' if @number.nil?
    end

    def distill(response_doc)
      xml = response_doc.at_xpath('//SalesOrder')
      Fishbowl::Objects::SalesOrder.from_xml(xml) if xml
    end

  end

end
