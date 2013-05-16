require 'nokogiri'
require 'fishbowl/requests/base_request'

module Fishbowl::Requests

  class GetCustomerNameList < BaseRequest

    def compose
      envelope('CustomerNameListRq')
    end

  protected

    def distill(response_doc)
      response_doc.xpath('//Customer/Name').map { |n| n.text }
    end

  end

end
