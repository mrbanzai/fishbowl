require 'roxml'

module Fishbowl::Objects

  class UOMConversion
    include ROXML

    xml_accessor :main_uom_id, :from => 'MainUOMID', :as => Integer
    xml_accessor :to_uom_id, :from => 'ToUOMID', :as => Integer
    xml_accessor :to_uom_code, :from => 'ToUOMCode'
    xml_accessor :conversion_multiply, :from => 'ConversionMultiply', :as => Float
    xml_accessor :conversion_factor, :from => 'ConversionFactor', :as => Float
    xml_accessor :to_uom_is_integral?, :from => 'ToUOMIsIntegral'
  end

  class UOM
    include ROXML

    xml_name 'UOM'
    xml_accessor :uom_id, :from => 'UOMID', :as => Integer
    xml_accessor :name, :from => 'Name'
    xml_accessor :code, :from => 'Code'
    xml_accessor :integral?, :from => 'Integral'
    xml_accessor :active?, :from => 'Active'
    xml_accessor :type, :from => 'Type'
    xml_accessor :conversions, :from => 'UOMConversions', :as => [UOMConversion]
  end

end
