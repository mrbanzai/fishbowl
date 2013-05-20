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
      Fishbowl::Objects::Product.from_xml(response_doc.at_xpath('//Product'))
    end

  end

end
