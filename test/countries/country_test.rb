require 'test_helper'

class CountryTest < Test::Unit::TestCase

  should "include 'Common Methods' module" do
    assert_contains Decoder::State.included_modules, CommonMethods
  end

  context "English" do
    setup do
      Decoder.i18n = :en
    end
    
    context "Loading the YAML" do
      setup do
        @country = Decoder::Country.new(:code => "US", :name => "United States")
      end

      should "load yaml/states/us/en.yml" do
        assert_match /en.yml/, @country.yaml_file_name
      end
      
      should "set the #states with the US state data" do
        YAML.expects(:load_file).returns({:en => {"US" => {:name => "United States",
              :states => {"MA" => "Massachusetts"}}}})
        @country.load_yaml
        assert "Massachusetts", @country.states[:MA]
      end
    end
    
    context "a new object" do
      should "load the yaml" do
        Decoder::Country.any_instance.expects(:load_yaml)
        Decoder::Country.new(:code => "US", :name => "United States")
      end
    end
    
    context "Getting a state" do
      setup do
        @country = Decoder::Country.new(:code => "US", :name => "United States")
      end
      
      should "return a state object of \"Massachusetts\" for :MA" do
        state = @country[:MA]
        assert_equal Decoder::State, state.class
      end
      
      should "return a state object of \"Massachusetts\" for :ma" do
        state = @country[:ma]
        assert_equal Decoder::State, state.class
      end

      should "return a state object of \"Massachusetts\" for \"MA\"" do
        state = @country["MA"]
        assert_equal Decoder::State, state.class
      end

      should "return a state object of \"Massachusetts\" for \"ma\"" do
        state = @country["ma"]
        assert_equal Decoder::State, state.class
      end

    end
    
  end
  
  context "#states aliases" do
    setup do
      @country = Decoder::Country.new(:code => "US", :name => "United States")
    end
    
    should "be equal for #states and #provinces" do
      assert_equal @country.states, @country.provinces
    end
    
    should "be equal for #states and #territories" do
      assert_equal @country.states, @country.territories
    end
  end
  
end