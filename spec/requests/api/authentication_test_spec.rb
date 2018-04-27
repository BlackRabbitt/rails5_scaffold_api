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

    it "gives you an authentication code if you are an existing user and you satisfy the password" do
      login(@current_api_user.email, @current_api_user.password)
      expect(response.has_header?('access-token')).to eq(true)
    end

    it "gives you a status 200 on signing in " do
      login(@current_api_user.email, @current_api_user.password)
      expect(response.status).to eq(200)
    end

    it "gives you an unauthorized error if you don't have enough role" do
      login(@current_api_user.email, @current_api_user.password)
      auth_params = get_auth_params_from_login_response_headers(response)
      role_params = Hash.new
      role_params[:roles] = {label: "user"}
      post api_roles_path, params: role_params, headers: auth_params

      expect(response.status).to eq(401)
    end
  end
end
