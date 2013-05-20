require 'roxml'
require 'fishbowl/objects/part'
require 'fishbowl/objects/uom'

module Fishbowl::Objects
  class Product
    include ROXML

    xml_accessor :db_id, :from => 'ID', :as => Integer
    xml_accessor :part_id, :from => 'PartID', :as => Integer
    xml_accessor :part, :from => 'Part', :as => Part
    xml_accessor :num, :from => 'Num'
    xml_accessor :description, :from => 'Description'
    xml_accessor :details, :from => 'Details'
    xml_accessor :upc, :from => 'UPC'
    xml_accessor :sku, :from => 'SKU'
    xml_accessor :price, :from => 'Price', :as => Float
    xml_accessor :uom, :from => 'UOM', :as => UOM
    xml_accessor :default_so_item_type, :from => 'DefaultSOItemType'
    xml_accessor :display_type, :from => 'DisplayType'
    xml_accessor :url, :from => 'URL'
    xml_accessor :weight, :from => 'Weight', :as => Float
    xml_accessor :weight_uom_id, :from => 'WeightUOMID', :as => Integer
    xml_accessor :width, :from => 'Width', :as => Float
    xml_accessor :height, :from => 'Height', :as => Float
    xml_accessor :len, :from => 'Len', :as => Float
    xml_accessor :size_uom_id, :from => 'SizeUOMID', :as => Integer
    xml_accessor :accounting_id, :from => 'AccountingID'
    xml_accessor :accounting_hash, :from => 'AccountingHash'
    xml_accessor :sellable_in_other_uom?, :from => 'SellableInOtherUOMFlag'
    xml_accessor :active?, :from => 'Active'
    xml_accessor :taxable?, :from => 'TaxableFlag'
    xml_accessor :use_price?, :from => 'UsePriceFlag'
    xml_accessor :kit?, :from => 'KitFlag'
    xml_accessor :show_so_combo?, :from => 'ShowSOComboFlag'
    xml_accessor :image, :from => 'Image'
    xml_accessor :date_modified, :from => 'DateModified'
    xml_accessor :custom_fields, :from => 'CustomField', :as => [CustomField], :in => 'CustomFields'
  end
end
