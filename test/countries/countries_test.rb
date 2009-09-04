require 'test_helper'

class CountriesTest < Test::Unit::TestCase
  context "English" do
    setup do
      Decoder.i18n = :en
    end
    
    context "Loading the YAML" do
      setup do
        @countries = Decoder::Countries.new
      end

      should "load yaml/countries/en.yml" do
        assert_match /en.yml/, @countries.yaml_file_name
      end
      
      should "set the #countries with the country data" do
        YAML.expects(:load_file).returns({:US => "United States"})
        @countries.load_yaml
        assert "United States", @countries.countries[:US]
      end
    end
    
    context "a new object" do
      should "load the yaml" do
        Decoder::Countries.any_instance.expects(:load_yaml)
        Decoder::Countries.new
      end
    end
    
    context "Getting a country" do
      setup do
        @countries = Decoder::Countries.new
      end
      
      should "return a country object of \"United States\" for :US" do
        country = @countries[:US]
        assert_equal Decoder::Country, country.class
        assert_equal "United States", country.to_s
      end

      should "return a country object of \"United States\" for :us" do
        country = @countries[:us]
        assert_equal Decoder::Country, country.class
        assert_equal "United States", country.to_s
      end

      should "return a country object of \"United States\" for \"US\"" do
        country = @countries["US"]
        assert_equal Decoder::Country, country.class
        assert_equal "United States", country.to_s
      end

      should "return a country object of \"United States\" for \"us\"" do
        country = @countries["us"]
        assert_equal Decoder::Country, country.class
        assert_equal "United States", country.to_s
      end

    end
    
    context "Getting a country alternate form" do

      should "return a country object of \"United States\" for :US" do
        country = Decoder::Countries[:US]
        assert_equal Decoder::Country, country.class
        assert_equal "United States", country.to_s
      end

      should "return a country object of \"United States\" for :us" do
        country = Decoder::Countries[:us]
        assert_equal Decoder::Country, country.class
        assert_equal "United States", country.to_s
      end

      should "return a country object of \"United States\" for \"US\"" do
        country = Decoder::Countries["US"]
        assert_equal Decoder::Country, country.class
        assert_equal "United States", country.to_s
      end

      should "return a country object of \"United States\" for \"us\"" do
        country = Decoder::Countries["us"]
        assert_equal Decoder::Country, country.class
        assert_equal "United States", country.to_s
      end

    end

  end
  
end