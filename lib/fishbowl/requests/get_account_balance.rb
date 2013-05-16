require 'nokogiri'
require 'fishbowl/requests/base_request'

module Fishbowl::Requests

  class GetAccountBalance < BaseRequest

    def compose
      envelope('GetAccountBalanceRq')
    end

  protected

    def distill(response_doc)
      # Undefined response
    end

  end

end
