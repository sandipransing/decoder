module Decoder
  class State
    attr_accessor :code, :name
    
    def initialize(args)
      self.code = args[:code].to_s
      self.name = args[:name]
    end
    
    def to_s
      name
    end
  end
end