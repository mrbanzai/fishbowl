require 'nokogiri'
require 'fishbowl/requests/base_request'

module Fishbowl::Requests

  class GetVendorNameList < BaseRequest

    def compose
      envelope('VendorNameListRq')
    end

  protected

    def distill(response_doc)
      response_doc.xpath('//VendorName').map { |n| n.text }
    end

  end

end
