require 'roxml'

module Fishbowl::Objects

  class CustomListItem
    include ROXML

    xml_accessor :db_id, :from => 'ID', :as => Integer
    xml_accessor :name, :from => 'Name'
    xml_accessor :description, :from => 'Description'
  end

  class CustomList
    include ROXML

    xml_accessor :db_id, :from => 'ID', :as => Integer
    xml_accessor :name, :from => 'Name'
    xml_accessor :description, :from => 'Description'
    xml_accessor :items, :from => 'CustomListItem', :as => [CustomListItem], :in => 'CustomListItems'
  end

  class CustomField
    include ROXML

    xml_accessor :db_id, :from => 'ID', :as => Integer
    xml_accessor :type, :from => 'Type'
    xml_accessor :name, :from => 'Name'
    xml_accessor :description, :from => 'Description'
    xml_accessor :sort_order, :from => 'SortOrder', :as => Integer
    xml_accessor :info, :from => 'Info'
    xml_accessor :required?, :from => 'RequiredFlag'
    xml_accessor :active?, :from => 'ActiveFlag'
    xml_accessor :custom_lists, :from => 'CustomList', :as => [CustomList], :in => 'CustomLists'
  end

end
