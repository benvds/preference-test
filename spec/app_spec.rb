require File.expand_path '../spec_helper.rb', __FILE__

class MyTest < MiniTest::Spec

  include Rack::Test::Methods

  def app
    PreferencesQuestionaire
  end

  describe "preferences questionaire" do
    it "should successfully return a greeting" do
      get '/'
      assert last_response.ok?
    end
  end
end
