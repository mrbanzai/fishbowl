require 'nokogiri'
require 'fishbowl/requests/base_request'
require 'fishbowl/objects/uom'

module Fishbowl::Requests

  class GetUomList < BaseRequest

    def compose
      envelope('UOMRq')
    end

  protected

    def distill(response_doc)
      response_doc.xpath('//UOM').map { |n| Fishbowl::Objects::UOM.from_xml(n) }
    end

  end

end
