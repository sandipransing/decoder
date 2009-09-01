require 'test_helper'

class CommonMethodsTest < Test::Unit::TestCase

  class EmptyTest
    include CommonMethods
    attr_accessor :code, :name
  end
  
  context "CommonMethods" do
    setup do
      @empty_test = EmptyTest.new
      @empty_test.code = "TS"
      @empty_test.name = "TEST"
    end
    should "print #name for #to_s" do
      assert_equal @empty_test.name, @empty_test.to_s
    end
  
    should "print '#<#class code: code, #name: #name>" do
      assert_equal "#<CommonMethodsTest::EmptyTest code: TS, name: TEST>", @empty_test.inspect
    end
  end
end
