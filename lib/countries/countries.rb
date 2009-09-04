module Decoder
  class Countries

    def initialize
      self.countries = Decoder.locale[Decoder.i18n]
    end
    
    def inspect
      %{#<#{self.class}>}
    end

    def countries=(_countries)
      @countries = _countries
    end
    
    def countries
      @countries
    end

    def [](_code)
      _code   = _code.to_s.upcase
      country = countries[_code]
      Decoder::Country.new(:code => _code, :name => country[:name])
    end
    
    def self.[](_code)
      self.new[_code]
    end
  end
end