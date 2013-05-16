require 'nokogiri'
require 'fishbowl/requests/base_request'

module Fishbowl::Requests

  class GetCarrierList < BaseRequest

    def compose
      envelope('CarrierListRq')
    end

  protected

    def distill(response_doc)
      response_doc.xpath('//Carriers/Name').map { |n| n.text }
    end

  end

end
