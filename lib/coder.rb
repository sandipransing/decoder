require 'countries/countries'
require 'countries/country'
require 'states/state'

module Coder
  def self.i18n
    @i18n ||= :eng
  end
  
  def self.i18n=(code)
    @i18n = code
  end
end