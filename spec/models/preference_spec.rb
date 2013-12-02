require File.expand_path '../../spec_helper.rb', __FILE__

describe Preference do
  describe "validations" do
    it "should require a name" do
      Preference.new().wont_be :valid?
      Preference.new(:value => '').wont_be :valid?
      Preference.new(:value => 'foo').must_be :valid?
    end
  end
end
