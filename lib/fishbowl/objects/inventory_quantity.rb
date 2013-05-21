require 'roxml'
require 'fishbowl/objects/part'
require 'fishbowl/objects/location'
require 'fishbowl/objects/tracking'

module Fishbowl::Objects
  class InventoryQuantity
    include ROXML

    xml_accessor :part, :from => 'Part', :as => Part
    xml_accessor :location, :from => 'Location', :as => Location
    xml_accessor :qty_on_hand, :from => 'QtyOnHand', :as => Integer
    xml_accessor :qty_available, :from => 'QtyAvailable', :as => Integer
    xml_accessor :qty_committed, :from => 'QtyCommitted', :as => Integer
    xml_accessor :tracking, :from => 'Tracking', :as => Tracking
  end
end