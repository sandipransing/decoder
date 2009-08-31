require 'test_helper'

class CountryTest < Test::Unit::TestCase
  context "English" do
    setup do
      Coder.i18n = :eng
    end
    
    context "Loading the YAML" do
      setup do
        @country = Coder::Country.new(:code => "US", :name => "United States")
      end

      should "load yaml/states/us/eng.yml" do
        assert_match /eng.yml/, @country.yaml_file_name
        assert_match /us/, @country.yaml_file_name
      end
      
      should "set the #loaded_states with the US state data" do
        YAML.expects(:load_file).returns({:MA => "Massachusetts"})
        @country.load_yaml
        assert "Massachusetts", @country.loaded_states[:MA]
      end
    end
    
    context "a new object" do
      should "load the yaml" do
        Coder::Country.any_instance.expects(:load_yaml)
        Coder::Country.new(:code => "US", :name => "United States")
      end
    end
    
    context "Getting a state" do
      setup do
        @country = Coder::Country.new(:code => "US", :name => "United States")
      end
      
      should "return a state object of \"Massachusetts\" for :MA" do
        state = @country[:MA]
        assert_equal Coder::State, state.class
        assert_equal "Massachusetts", state.to_s
      end
      
      should "return a state object of \"Massachusetts\" for :ma" do
        state = @country[:ma]
        assert_equal Coder::State, state.class
        assert_equal "Massachusetts", state.to_s
      end

      should "return a state object of \"Massachusetts\" for \"MA\"" do
        state = @country["MA"]
        assert_equal Coder::State, state.class
        assert_equal "Massachusetts", state.to_s
      end

      should "return a state object of \"Massachusetts\" for \"ma\"" do
        state = @country["ma"]
        assert_equal Coder::State, state.class
        assert_equal "Massachusetts", state.to_s
      end

    end
    
    should "return 'United States' for #to_s" do
      country = Coder::Country.new(:code => "US", :name => "United States")
      assert_equal "United States", country.to_s
    end
  end
  
end