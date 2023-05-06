require "rack/test"

require "./src/application"


context "with no session" do
  include Rack::Test::Methods

  let(:app) { DworldApplication }

  describe "/" do
    it "redirects to login" do
      get "/"

      expect(last_response.status).to eq(302)
    end
  end
end
