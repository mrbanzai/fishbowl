require 'nokogiri'
require 'fishbowl/requests/base_request'
require 'fishbowl/objects/customer'

module Fishbowl::Requests

  class GetCustomerList < BaseRequest

    def compose
      envelope('CustomerListRq')
    end

  protected

    def distill(response_doc)
      response_doc.xpath('//Customer').map { |n| Fishbowl::Objects::Customer.from_xml(n) }
    end

  end

end
