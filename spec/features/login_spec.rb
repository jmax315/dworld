require "rack/test"

require "./src/application"


describe "/" do
  include Rack::Test::Methods

  let(:app) { DworldApplication }

  context "with no session" do
    before { get "/" }

    it "redirects to login" do
      expect(last_response.status).to eq(302)
      expect(last_response.location).to eq("http://example.org/login")
    end
  end

  context "with a session" do
    let(:user_id) { 'steph' }

    before { get "/", {}, {'rack.session' => {user_id: user_id}} }

    it "redirects to their current page" do
      expect(last_response.status).to eq(302)
      expect(last_response.location).to eq("http://example.org/view/#{user_id}")
    end
  end
end
