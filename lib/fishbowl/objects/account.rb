require 'roxml'

module Fishbowl::Objects

  class Account
    include ROXML

    xml_accessor :name, :from => 'Name'
    xml_accessor :accounting_id, :from => 'AccountingID'
    xml_accessor :account_type, :from => 'AccountType', :as => Integer
    xml_accessor :balance, :from => 'Balance', :as => Float
  end

end
