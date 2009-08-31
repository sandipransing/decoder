require 'test_helper'

class CountriesTest < Test::Unit::TestCase
  context "English" do
    setup do
      Coder.i18n = :eng
    end
    
    context "Loading the YAML" do
      setup do
        @countries = Coder::Countries.new
      end

      should "load yaml/countries/eng.yml" do
        assert_match /eng.yml/, @countries.yaml_file_name
      end
      
      should "set the #loaded_countries with the country data" do
        YAML.expects(:load_file).returns({:US => "United States"})
        @countries.load_yaml
        assert "United States", @countries.loaded_countries[:US]
      end
    end
    
    context "a new object" do
      should "load the yaml" do
        Coder::Countries.any_instance.expects(:load_yaml)
        Coder::Countries.new
      end
    end
    
    context "Getting a country" do
      setup do
        @countries = Coder::Countries.new
      end
      
      should "return a country object of \"United States\" for :US" do
        country = @countries[:US]
        assert_equal Coder::Country, country.class
        assert_equal "United States", country.to_s
      end

      should "return a country object of \"United States\" for :us" do
        country = @countries[:us]
        assert_equal Coder::Country, country.class
        assert_equal "United States", country.to_s
      end

      should "return a country object of \"United States\" for \"US\"" do
        country = @countries["US"]
        assert_equal Coder::Country, country.class
        assert_equal "United States", country.to_s
      end

      should "return a country object of \"United States\" for \"us\"" do
        country = @countries["us"]
        assert_equal Coder::Country, country.class
        assert_equal "United States", country.to_s
      end

    end
    
    context "Getting a country alternate form" do

      should "return a country object of \"United States\" for :US" do
        country = Coder::Countries[:US]
        assert_equal Coder::Country, country.class
        assert_equal "United States", country.to_s
      end

      should "return a country object of \"United States\" for :us" do
        country = Coder::Countries[:us]
        assert_equal Coder::Country, country.class
        assert_equal "United States", country.to_s
      end

      should "return a country object of \"United States\" for \"US\"" do
        country = Coder::Countries["US"]
        assert_equal Coder::Country, country.class
        assert_equal "United States", country.to_s
      end

      should "return a country object of \"United States\" for \"us\"" do
        country = Coder::Countries["us"]
        assert_equal Coder::Country, country.class
        assert_equal "United States", country.to_s
      end

    end

  end
  
end