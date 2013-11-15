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
      id_node = response.at_xpath('//Ticket/UserID')
      name_node = response.at_xpath('//LoginRs/UserFullName')

      { :user_id => (id_node.text if id_node),
        :full_name => (name_node.text if name_node) }
    end

  end

end
