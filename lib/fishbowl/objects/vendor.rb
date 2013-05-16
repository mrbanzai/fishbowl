require 'roxml'
require 'fishbowl/objects/address'
require 'fishbowl/objects/custom_field'

module Fishbowl::Objects

  class Vendor
    include ROXML

    xml_name 'Vendor'
    xml_accessor :vendor_id, :from => 'VendorID', :as => Integer
    xml_accessor :account_id, :from => 'AccountID', :as => Integer
    xml_accessor :status, :from => 'Status'
    xml_accessor :def_payment_terms, :from => 'DefPaymentTerms'
    xml_accessor :def_ship_terms, :from => 'DefShipTerms'
    xml_accessor :tax_rate, :from => 'TaxRate'
    xml_accessor :name, :from => 'Name'
    xml_accessor :number, :from => 'Number'
    xml_accessor :date_created, :from => 'DateCreated'
    xml_accessor :date_modified, :from => 'DateModified'
    xml_accessor :last_changed_user, :from => 'LastChangedUser'
    xml_accessor :credit_limit, :from => 'CreditLimit', :as => Float
    xml_accessor :note, :from => 'Note'
    xml_accessor :sys_user_id, :from => 'SysUserID', :as => Integer
    xml_accessor :active?, :from => 'ActiveFlag'
    xml_accessor :accounting_id, :from => 'AccountingID'
    xml_accessor :accounting_hash, :from => 'AccountingHash'
    xml_accessor :lead_time, :from => 'LeadTime', :as => Integer
    xml_accessor :addresses, :from => 'Address', :as => [Address], :in => 'Addresses'
    xml_accessor :custom_fields, :from => 'CustomField', :as => [CustomField], :in => 'CustomFields'
  end

end
