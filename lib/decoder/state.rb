module Decoder
  class State
    include ::CommonMethods
    attr_accessor :code, :name

    def initialize(args)
      self.code = args[:code].to_s
      self.name = args[:name]
    end
  end
end