require 'roxml'

module Fishbowl::Objects

  class User
    include ROXML

    xml_name 'User'
    xml_accessor :db_id, :from => 'ID', :as => Integer
    xml_accessor :user_name, :from => 'UserName'
    xml_accessor :first_name, :from => 'FirstName'
    xml_accessor :last_name, :from => 'LastName'
    xml_accessor :initials, :from => 'Initials'
    xml_accessor :active?, :from => 'Active'
  end

end
