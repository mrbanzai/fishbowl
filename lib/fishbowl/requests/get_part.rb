require 'nokogiri'
require 'fishbowl/requests/base_request'
require 'fishbowl/objects/part'

module Fishbowl::Requests

  class GetPart < BaseRequest
    attr_accessor :light_part, :part_num, :location_group

    def compose
      if @light_part && @light_part.is_a?(Fishbowl::Objects::LightPart)
        @part_num = @light_part.num
      end

      envelope(Nokogiri::XML::Builder.new do |xml|
        xml.request {
          if @location_group.nil?
            xml.PartGetRq {
              xml.Number @part_num
            }
          else
            xml.PartQueryRq {
              xml.PartNum @part_num
              xml.LocationGroup @location_group
            }
          end
        }
      end)
    end

  protected

    def distill(response_doc)
      Fishbowl::Objects::Part.from_xml(response_doc.at_xpath('//Part'))
    end

  end

end
