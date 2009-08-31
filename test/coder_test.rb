require 'test_helper'

class CoderTest < Test::Unit::TestCase
  context "i18n" do
    should "default to :eng" do
      assert_equal :eng, Coder.i18n
    end
    
    should "set the Internationalization code to :gla (Gaelic)" do
      Coder.i18n = :gla
      assert_equal :gla, Coder.i18n
    end
  end
end
