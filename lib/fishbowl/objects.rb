module Fishbowl
  module Objects; end; # :nodoc:
end

Dir.glob(File.join(File.expand_path('../objects/', __FILE__), '**.rb')).each do |file|
  require file
end
