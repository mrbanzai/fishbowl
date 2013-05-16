require 'nokogiri'
require 'fishbowl/requests/base_request'
require 'fishbowl/objects/account'

module Fishbowl::Requests

  class GetAccountList < BaseRequest

    def compose
      envelope('GetAccountListRq')
    end

  protected

    def distill(response_doc)
      response_doc.xpath('//Account').map { |n| Fishbowl::Objects::Account.from_xml(n) }
    end

  end

end
