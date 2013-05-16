require 'nokogiri'
require 'fishbowl/objects/sales_order'
require 'fishbowl/requests/base_request'

module Fishbowl::Requests

  class SaveSalesOrder < BaseRequest

    attr_accessor :sales_order

    def issue=(issue)
      @issue = issue
    end

    def issue?
      @issue || false
    end

    def compose
      validate
      envelope(Nokogiri::XML::Builder.new do |xml|
        xml.request {
          xml.SOSaveRq {
            xml << @sales_order.to_xml
            xml.IssueFlag issue?
          }
        }
      end)
    end

  protected

    def validate
      raise 'Missing field: issue' if @issue.nil?
      raise 'Missing field: sales_order' if @sales_order.nil?
      raise 'sales_order must be a SalesOrder object' if !@sales_order.is_a?(Fishbowl::Objects::SalesOrder)
    end

    def distill(response_doc)
    end

  end

end
