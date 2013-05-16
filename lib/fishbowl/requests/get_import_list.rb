require 'nokogiri'
require 'fishbowl/requests/base_request'

module Fishbowl::Requests

  class GetImportList < BaseRequest

    def compose
      envelope('ImportListRq')
    end

  protected

    def distill(response_doc)
      response_doc.xpath('//ImportName').map { |n| n.text }
    end

  end

end
