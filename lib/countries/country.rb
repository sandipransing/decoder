module Coder
  class Country
    attr_accessor :states, :code, :name
    
    def initialize(args)
      self.code = args[:code].to_s
      self.name = args[:name]
      
      self.load_yaml
    end
    
    def load_yaml
      self.states = YAML.load_file(yaml_file_name)
    end
    
    def yaml_file_name
      "#{File.dirname(__FILE__)}/../i18n/states/#{code.downcase}/#{Coder.i18n}.yml"
    end
    
    def [](_code)
      _code = _code.to_s.upcase.to_sym
      state = states[_code]
      Coder::State.new(:code => _code.to_s, :name => state)
    end
    
    def to_s
      name
    end
  end
end