require 'nokogiri'
require 'fishbowl/requests/base_request'
require 'fishbowl/objects/shipping'

module Fishbowl::Requests

  class GetShipment < BaseRequest
    attr_accessor :shipment_id

    def compose
      envelope(Nokogiri::XML::Builder.new do |xml|
        xml.request {
          xml.GetShipmentRq {
            xml.ShipmentID @shipment_id
          }
        }
      end)
    end

  protected

    def validate
      raise 'shipment_id is required' if @shipment_id.nil?
    end

    def distill(response_doc)
      Fishbowl::Objects::Shipping.from_xml(response_doc.at_xpath('//Shipping'))
    end

  end

end
