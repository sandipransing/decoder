require 'test_helper'

class CommonMethodsTest < Test::Unit::TestCase

  class EmptyClass
    include CommonMethods
    attr_accessor :code, :name
  end
  
  context "CommonMethods" do
    setup do
      @empty_class = EmptyClass.new
      @empty_class.code = "TS"
      @empty_class.name = "TEST"
    end
    should "print #name for #to_s" do
      assert_equal @empty_class.name, @empty_class.to_s
    end
  
    should "print '#<#class code: code, #name: #name>" do
      assert_equal "#<CommonMethodsTest::EmptyClass code: TS, name: TEST>", @empty_class.inspect
    end
  end
end
