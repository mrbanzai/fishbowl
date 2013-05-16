require 'nokogiri'
require 'fishbowl/requests/base_request'

module Fishbowl::Requests

  class ExportType < BaseRequest
    attr_accessor :export_type

    def compose
      envelope(Nokogiri::XML::Builder.new do |xml|
        xml.request {
          xml.ExportRq {
            xml.Type @export_type
          }
        }
      end)
    end

  protected

    def validate
      raise ArgumentError, 'Must provide export_type' if @export_type.nil?
    end

    def distill(response_doc)
     # response_doc.xpath('//ExportName').map { |n| n.text }
    end

  end

end
