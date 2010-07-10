require 'test_helper'

class DecoderTest < Test::Unit::TestCase
  context "i18n" do
    should "default to :eng" do
      assert_equal :en, Decoder.i18n
    end

    should "set the Internationalization code to :de (German)" do
      Decoder.i18n = :de
      assert_equal :de, Decoder.i18n
      assert_nil Decoder.class_eval { @locale }
    end
  end

  context "File loading" do
    setup do
      Decoder.locale = nil
    end

    should "only load once" do
      YAML.expects(:load_file).returns({:en => {"US" => {:name => "United States",
            :states => {"MA" => "Massachusetts"}}}})
      locale = Decoder.locale
      Decoder.locale
      Decoder::Countries.new
      Decoder::Country.new(:code => "US", :name => "United States")
    end
  end
end
