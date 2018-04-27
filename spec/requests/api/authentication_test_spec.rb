require 'rails_helper'
include ActionController::RespondWith

# The authentication header looks something like this:
# {"access-token"=>"abcd1dMVlvW2BT67xIAS_A", "token-type"=>"Bearer", "client"=>"LSJEVZ7Pq6DX5LXvOWMq1w", "expiry"=>"1519086891", "uid"=>"darnell@konopelski.info"}

describe "proper access", type: :request do
  before(:each) do
    @current_api_user = FactoryBot.create(:user)
  end

  context "context: general authentication via API, " do
    it "doesn't give you anything if you don't log in" do
      post api_roles_path, params: {roles: {label: "user"}}.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      expect(response.status).to eq(401)
    end
  end
end
