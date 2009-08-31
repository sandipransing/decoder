require 'test_helper'

class StateTest < Test::Unit::TestCase
  context "English" do
    setup do
      Decoder.i18n = :eng
    end
    
    context "Getters" do
      setup do
        @state = Decoder::State.new(:code => "MA", :name => "Massachusetts")
      end

      should "return 'Massachusetts' for #to_s" do
        assert_equal "Massachusetts", @state.to_s
      end

      should "return 'Massachusetts' for #name" do
        assert_equal "Massachusetts", @state.name
      end

      should "return \"MA\" for #code" do
        assert_equal "MA", @state.code
      end
    end
  end
  
end