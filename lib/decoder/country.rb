module Decoder
  class Country
    include ::CommonMethods
    attr_accessor :code, :name
    
    def initialize(args)
      self.code   = args[:code].to_s
      self.name   = args[:name]
      self.states = Decoder.locale[Decoder.i18n][self.code][:states]
    end
    
    def states
      @states
    end
    
    def states=(_states)
      @states = _states
    end

    alias_method :counties, :states        
    alias_method :provinces, :states
    alias_method :territories, :states
    
    def [](_code)
      _code = _code.to_s.upcase
      state = states[_code]
      Decoder::State.new(:code => _code, :name => state)
    end
  end
end