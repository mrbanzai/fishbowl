require 'roxml'
require 'fishbowl/objects/address'
require 'fishbowl/objects/custom_field'

module Fishbowl::Objects

  class Customer
    include ROXML

    xml_name 'Customer'
    xml_accessor :customer_id, :from => 'CustomerID', :as => Integer
    xml_accessor :account_id, :from => 'AccountID', :as => Integer
    xml_accessor :status, :from => 'Status'
    xml_accessor :def_payment_terms, :from => 'DefPaymentTerms'
    xml_accessor :def_ship_terms, :from => 'DefShipTerms'
    xml_accessor :tax_rate, :from => 'TaxRate'
    xml_accessor :name, :from => 'Name'
    xml_accessor :number, :from => 'Number'
    xml_accessor :date_created, :from => 'DateCreated'
    xml_accessor :date_last_modified, :from => 'DateLastModified'
    xml_accessor :last_changed_user, :from => 'LastChangedUser'
    xml_accessor :credit_limit, :from => 'CreditLimit', :as => Float
    xml_accessor :tax_exempt?, :from => 'TaxExempt'
    xml_accessor :tax_exempt_number, :from => 'TaxExemptNumber'
    xml_accessor :note, :from => 'Note'
    xml_accessor :active?, :from => 'ActiveFlag'
    xml_accessor :accounting_id, :from => 'AccountingID'
    xml_accessor :default_salesman, :from => 'DefaultSalesman'
    xml_accessor :default_carrier, :from => 'DefaultCarrier'
    xml_accessor :default_ship_service, :from => 'DefaultShipService'
    xml_accessor :job_depth, :from => 'JobDepth'
    xml_accessor :parent_id, :from => 'ParentID', :as => Integer
    xml_accessor :pipeline_account, :from => 'PipelineAccount', :as => Integer
    xml_accessor :url, :from => 'URL'
    xml_accessor :addresses, :from => 'Address', :as => [Address], :in => 'Addresses'
    xml_accessor :custom_fields, :from => 'CustomField', :as => [CustomField], :in => 'CustomFields'
  end

end
