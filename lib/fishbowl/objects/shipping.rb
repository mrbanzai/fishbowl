require 'roxml'
require 'fishbowl/objects/carton'
require 'fishbowl/objects/address'

module Fishbowl::Objects

  class ShipSearchItem
    include ROXML

    xml_name 'ShipSearchItem'
    xml_accessor :ship_id, :from => 'ShipID', :as => Integer
    xml_accessor :order_number, :from => 'OrderNumber'
    xml_accessor :order_type, :from => 'OrderType'
    xml_accessor :ship_to, :from => 'ShipTo'
    xml_accessor :ship_to_num, :from => 'ShipToNum'
    xml_accessor :carrier, :from => 'Carrier'
    xml_accessor :date_scheduled, :from => 'DateScheduled'
    xml_accessor :date_shipped, :from => 'DateShipped'
    xml_accessor :status, :from => 'Status'

    def shipped?
      @status == 'Shipped'
    end
  end

  class Shipping
    include ROXML

    xml_name 'Shipping'
    xml_accessor :db_id, :from => 'ID', :as => Integer
    xml_accessor :order_number, :from => 'OrderNumber'
    xml_accessor :order_type, :from => 'OrderType'
    xml_accessor :created_date, :from => 'CreatedDate'
    xml_accessor :date_last_modified, :from => 'DateLastModified'
    xml_accessor :carrier, :from => 'Carrier'
    xml_accessor :status, :from => 'Status', :as => Integer
    xml_accessor :fob, :from => 'FOB'
    xml_accessor :note, :from => 'Note'
    xml_accessor :carton_count, :from => 'CartonCount', :as => Integer
    xml_accessor :address, :from => 'Address', :as => Address
    xml_accessor :cartons, :from => 'Carton', :as => [Carton], :in => 'Cartons'
  end

end
