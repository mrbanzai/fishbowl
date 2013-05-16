require 'roxml'

module Fishbowl::Objects

  class PartTracking
    include ROXML

    xml_accessor :part_tracking_id, :from => 'PartTrackingID', :as => Integer
    xml_accessor :name, :from => 'Name'
    xml_accessor :abbr, :from => 'Abbr'
    xml_accessor :description, :from => 'Description'
    xml_accessor :sort_order, :from => 'SortOrder', :as => Integer
    xml_accessor :tracking_type_id, :from => 'TrackingTypeID', :as => Integer
    xml_accessor :active?, :from => 'Active'
  end

  class TrackingItem
    include ROXML

    xml_accessor :part_tracking, :from => 'PartTracking', :as => PartTracking
    xml_accessor :tracking_value, :from => 'TrackingValue'
  end

  class Tracking
    include ROXML

    xml_accessor :item, :from => 'TrackingItem', :as => TrackingItem
  end

end
