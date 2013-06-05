require 'nokogiri'
require 'fishbowl/requests/base_request'
require 'fishbowl/objects/shipping'

module Fishbowl::Requests

  class GetShipList < BaseRequest
    attr_accessor :record_count, :order_number, :order_type, :location_group, :carrier

    def compose
      envelope(Nokogiri::XML::Builder.new do |xml|
        xml.request {
          xml.GetShipListRq {
            xml.RecordCount @record_count
            xml.OrderNumber @order_number unless @order_number.nil?
            xml.OrderTypeID @order_type unless @order_type.nil?
            xml.LocationGroup @location_group unless @location_group.nil?
            xml.Carrier @carrier unless @carrier.nil?
          }
        }
      end)
    end

  protected

    def validate
      raise 'Record count is required' if @record_count.nil?
      if @order_number && (@order_type || @carrier)
        raise 'Cannot use order_number in conjunction with orer_type / carrier'
      end
    end

    def distill(response_doc)
      response_doc.xpath('//ShipSearchItem').map { |n| Fishbowl::Objects::ShipSearchItem.from_xml(n) }
    end

  end

end
