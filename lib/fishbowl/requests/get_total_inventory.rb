require 'nokogiri'
require 'fishbowl/requests/base_request'

module Fishbowl::Requests

  class GetTotalInventory < BaseRequest

    attr_accessor :part_number, :location_group

    def compose
      validate
      envelope(Nokogiri::XML::Builder.new do |xml|
        xml.request {
          xml.GetTotalInventoryRq {
            xml.PartNumber @part_number
            xml.LocationGroup @location_group
          }
        }
      end)
    end

  protected

    def validate
      %w{part_number location_group}.each do |field|
        raise "Missing field: #{field}" if field.nil?
      end
    end

    def distill(response)
      response.at_xpath('//Available').text.to_i
    end

  end

end
