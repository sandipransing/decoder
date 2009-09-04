module Decoder
  class Country
    include ::CommonMethods
    attr_accessor :states, :code, :name
    alias_method :provinces, :states
    alias_method :territories, :states
    
    def initialize(args)
      self.code = args[:code].to_s
      self.name = args[:name]
      
      self.load_yaml
    end
    
    def load_yaml
      self.states = YAML.load_file(yaml_file_name)[Decoder.i18n][self.code][:states]
    end
    
    def yaml_file_name
      "#{File.dirname(__FILE__)}/../locales/#{Decoder.i18n}.yml"
    end
    
    def [](_code)
      _code = _code.to_s.upcase
      state = states[_code]
      Decoder::State.new(:code => _code, :name => state)
    end
  end
end