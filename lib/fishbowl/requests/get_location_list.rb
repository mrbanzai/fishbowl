require 'nokogiri'
require 'fishbowl/requests/base_request'
require 'fishbowl/objects/location'

module Fishbowl::Requests

  class GetLocationList < BaseRequest

    def compose
      envelope('LocationListRq')
    end

  protected

    def distill(response_doc)
      response_doc.xpath('//Location').map { |n| Fishbowl::Objects::Location.from_xml(n) }
    end

  end

end
