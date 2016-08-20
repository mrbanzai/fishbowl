require 'nokogiri'
require 'fishbowl/objects/sales_order'
require 'fishbowl/requests/base_request'

module Fishbowl::Requests

  class GetSalesOrderList < BaseRequest

    attr_accessor :so_num
    attr_accessor :customer_po
    attr_accessor :account_number
    attr_accessor :product_num

    def compose
      validate
      envelope(Nokogiri::XML::Builder.new do |xml|
        xml.request {
          xml.GetSOListRq {
            xml.SONum @so_num unless @so_num.nil?
            xml.CustomerPO @customer_po unless @customer_po.nil?
            xml.AccountNumber @account_number unless @account_number.nil?
            xml.ProductNum @product_num unless @product_num.nil?
          }
        }
      end)
    end

  protected

    def validate
    end

    def distill(response_doc)
      response_doc.xpath('//SalesOrder').map { |n| Fishbowl::Objects::SalesOrder.from_xml(n) }
    end

  end

end
