module Coder
  class Countries
    attr_accessor :loaded_countries
    
    def initialize
      self.load_yaml
    end
    
    def load_yaml
      self.loaded_countries = YAML.load_file(yaml_file_name)
    end
    
    def yaml_file_name
      "#{File.dirname(__FILE__)}/../i18n/countries/#{Coder.i18n}.yml"
    end
    
    def [](code)
      code    = code.to_s.upcase.to_sym
      country = loaded_countries[code]
      Coder::Country.new(:code => code.to_s, :name => country)
    end
  end
end