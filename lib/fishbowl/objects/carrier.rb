require 'roxml'

module Fishbowl::Objects

  class Carrier
    include ROXML

    xml_accessor :name, :from => 'Name'
  end

end
