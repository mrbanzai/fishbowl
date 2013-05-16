require 'roxml'

module Fishbowl::Objects
  class Memo
    include ROXML

    xml_accessor :db_id, :from => 'ID', :as => Integer
    xml_accessor :memo, :from => 'Memo'
    xml_accessor :user_name, :from => 'UserName'
    xml_accessor :date_created, :from => 'DateCreated'
  end
end
