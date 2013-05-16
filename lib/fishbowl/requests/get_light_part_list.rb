require 'nokogiri'
require 'fishbowl/requests/base_request'
require 'fishbowl/objects/part'

module Fishbowl::Requests

  class GetLightPartList < BaseRequest

    def compose
      envelope('LightPartListRq')
    end

  protected

    def distill(response_doc)
      response_doc.xpath('//LightPart').map { |n| Fishbowl::Objects::LightPart.from_xml(n) }
    end

  end

end
