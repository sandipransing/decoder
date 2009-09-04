require 'test_helper'

class DecoderTest < Test::Unit::TestCase
  context "i18n" do
    should "default to :eng" do
      assert_equal :en, Decoder.i18n
    end
    
    should "set the Internationalization code to :de (German)" do
      Decoder.i18n = :de
      assert_equal :de, Decoder.i18n
    end
  end
end
