require 'nokogiri'
require 'fishbowl/requests/base_request'
require 'fishbowl/objects/vendor'

module Fishbowl::Requests

  class GetVendorList < BaseRequest

    def compose
      envelope('VendorRq')
    end

  protected

    def distill(response_doc)
      response_doc.xpath('//Vendor').map { |n| Fishbowl::Objects::Vendor.from_xml(n) }
    end

  end

end
