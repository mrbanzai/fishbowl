module Fishbowl
  module Objects; end; # :nodoc:
end

Dir.glob(File.join(File.expand_path('../objects/', __FILE__), '**.rb')).each do |file|
  require file
end

# Since there's currently no base object class, I'll
# mix it in here for now
Fishbowl::Objects.constants.each do |c|
  class_obj = Fishbowl::Objects.const_get(c)
  class_obj.class_eval do
    def self.from_hash(h)
      klass = self.new
      h.each { |k, v| klass.send("#{k}=", v) }
      klass
    end
  end
end
