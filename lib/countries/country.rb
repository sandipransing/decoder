module Decoder
  class Country
    attr_accessor :states, :code, :name
    alias_method :provinces, :states
    alias_method :territories, :states
    
    def initialize(args)
      self.code = args[:code].to_s
      self.name = args[:name]
      
      self.load_yaml
    end
    
    def load_yaml
      self.states = YAML.load_file(yaml_file_name)
    end
    
    def yaml_file_name
      "#{File.dirname(__FILE__)}/../i18n/states/#{code.downcase}/#{Decoder.i18n}.yml"
    end
    
    def [](_code)
      _code = _code.to_s.upcase
      state = states[_code]
      Decoder::State.new(:code => _code, :name => state)
    end
    
    def to_s
      name
    end
  end
end