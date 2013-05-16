require 'nokogiri'
require 'fishbowl/requests/base_request'

module Fishbowl::Requests

  class GetLocationGroupList < BaseRequest

    def compose
      envelope('LocationGroupRq')
    end

  protected

    def distill(response_doc)
      response_doc.xpath('//LocationGroupName').map { |n| n.text }
    end

  end

end
