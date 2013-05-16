require 'nokogiri'
require 'fishbowl/requests/base_request'
require 'fishbowl/objects/tracking'

module Fishbowl::Requests

  class AdjustInventory < BaseRequest

    attr_accessor :tag_num, :quantity, :tracking

    def compose
      validate
      envelope(Nokogiri::XML::Builder.new do |xml|
        xml.request {
          xml.AdjustInventoryRq {
            xml.TagNum @tag_num
            xml.Quantity @quantity
            xml.Tracking @tracking unless @tracking.nil?
          }
        }
      end)
    end

  protected

    def validate
      raise ArgumentError, 'tag_num is required' unless @tag_num
      raise ArgumentError, 'quantity is required' unless @quantity
      raise ArgumentError, 'tracking must be a valid Tracking object' if @tracking && !@tracking.is_a?(Fishbowl::Objects::Tracking)
    end

    def distill(response)
    end

  end

end
