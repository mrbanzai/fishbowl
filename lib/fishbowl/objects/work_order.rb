require 'roxml'
require 'fishbowl/objects/location'
require 'fishbowl/objects/user'
require 'fishbowl/objects/part'
require 'fishbowl/objects/uom'
require 'fishbowl/objects/tracking'

module Fishbowl::Objects

  class WorkOrderItem
    include ROXML

    xml_name 'WOItem'
    xml_accessor :db_id, :from => 'ID', :as => Integer
    xml_accessor :mo_item_id, :from => 'MOItemID', :as => Integer
    xml_accessor :type_id, :from => 'TypeID', :as => Integer
    xml_accessor :part, :from => 'Part', :as => Part
    xml_accessor :description, :from => 'Description'
    xml_accessor :cost, :from => 'Cost', :as => Float
    xml_accessor :date_scheduled, :from => 'DateScheduled'
    xml_accessor :instruction_note, :from => 'InstructionNote'
    xml_accessor :instruction_url, :from => 'InstructionURL'
    xml_accessor :qty_scrapped, :from => 'QtyScrapped', :as => Integer
    xml_accessor :qty_to_fulfill, :from => 'QtyToFulfill', :as => Integer
    xml_accessor :qty_used, :from => 'QtyUsed', :as => Integer
    xml_accessor :dest_location, :from => 'Location', :as => Location, :in => 'DestLocation'
    xml_accessor :uom, :from => 'UOM', :as => UOM
    xml_accessor :tracking, :from => 'Tracking', :as => Tracking
  end

  class WorkOrder
    include ROXML

    xml_name 'WO'
    xml_accessor :db_id, :from => 'ID', :as => Integer
    xml_accessor :num, :from => 'Num'
    xml_accessor :type, :from => 'Type'
    xml_accessor :type_id, :from => 'TypeID'
    xml_accessor :mo_item_id, :from => 'MOItemID', :as => Integer
    xml_accessor :items, :from => 'WOItem', :as => [WorkOrderItem], :in => 'WOItems'
    xml_accessor :cost, :from => 'Cost', :as => Float
    xml_accessor :location, :from => 'Location', :as => Location, :in => 'Location'
    xml_accessor :location_group, :from => 'LocationGroup', :as => LocationGroup
    xml_accessor :note, :from => 'Note'
    xml_accessor :status_id, :from => 'StatusID', :as => Integer
    xml_accessor :qb_class, :from => 'QBClass'
    xml_accessor :qb_class_id, :from => 'QBClassID', :as => Integer
    xml_accessor :qty_ordered, :from => 'QtyOrdered', :as => Integer
    xml_accessor :qty_target, :from => 'QtyTarget', :as => Integer
    xml_accessor :date_created, :from => 'DateCreated'
    xml_accessor :date_finished, :from => 'DateFinished'
    xml_accessor :date_last_modified, :from => 'DateLastModified'
    xml_accessor :date_scheduled, :from => 'DateScheduled'
    xml_accessor :date_started, :from => 'DateStarted'
    xml_accessor :user, :from => 'User', :as => User
  end

end