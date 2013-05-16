require 'nokogiri'
require 'fishbowl/requests/base_request'
require 'fishbowl/objects/work_order'

module Fishbowl::Requests

  class GetWorkOrderList < BaseRequest

    def compose
      envelope('WorkOrderListRq')
    end

  protected

    def distill(response_doc)
      response_doc.xpath('//WO').map { |n| Fishbowl::Objects::WorkOrder.from_xml(n) }
    end

  end

end
