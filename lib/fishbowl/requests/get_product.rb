require 'nokogiri'
require 'fishbowl/requests/base_request'
require 'fishbowl/objects/part'

module Fishbowl::Requests

  class GetProduct < BaseRequest
    attr_accessor :product_num, :get_image

    def compose
      envelope(Nokogiri::XML::Builder.new do |xml|
        xml.request {
          xml.ProductQueryRq {
            xml.ProductNum @product_num
            xml.GetImage @get_image if @get_image
          }
        }
      end)
    end

  protected

    def distill(response_doc)
      #response_doc.xpath('//Customer').map { |n| Fishbowl::Objects::Customer.from_xml(n) }
    end

  end

end
