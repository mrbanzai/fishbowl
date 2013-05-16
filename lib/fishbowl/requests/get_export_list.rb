require 'nokogiri'
require 'fishbowl/requests/base_request'

module Fishbowl::Requests

  class GetExportList < BaseRequest

    def compose
      envelope('ExportListRq')
    end

  protected

    def distill(response_doc)
      response_doc.xpath('//ExportName').map { |n| n.text }
    end

  end

end
