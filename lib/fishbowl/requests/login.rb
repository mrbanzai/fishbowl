require 'digest'
require 'nokogiri'
require 'fishbowl/requests/base_request'

module Fishbowl::Requests

  class Login < BaseRequest

    attr_accessor :username, :password

    def encoded_password
      md5 = Digest::MD5.new << @password
      md5.base64digest
    end

    def compose
      envelope(Nokogiri::XML::Builder.new do |xml|
        xml.request {
          xml.LoginRq {
            xml.IAID          'fishbowl-ruby'
            xml.IAName        'Fishbowl Ruby Gem'
            xml.IADescription 'Fishbowl Ruby Gem'
            xml.UserName      @username
            xml.UserPassword  encoded_password
          }
        }
      end)
    end

  protected

    def distill(response)
      { :user_id => response.at_xpath('//Ticket/UserID').text,
        :full_name => response.at_xpath('//LoginRs/UserFullName').text }
    end

  end

end
