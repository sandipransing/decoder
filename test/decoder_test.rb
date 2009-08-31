require 'test_helper'

class DecoderTest < Test::Unit::TestCase
  context "i18n" do
    should "default to :eng" do
      assert_equal :eng, Decoder.i18n
    end
    
    should "set the Internationalization code to :gla (Gaelic)" do
      Decoder.i18n = :gla
      assert_equal :gla, Decoder.i18n
    end
  end
end
