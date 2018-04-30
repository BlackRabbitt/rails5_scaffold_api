require 'rails_helper'
include ActionController::RespondWith

describe "/api/roles", type: :request do
  before(:each) do
    @role_params = {
      role:
        {
          label: "role-manager-4",
          permissions: [
            {resource_type: "Role", action: "create"},
            {resource_type: "Permission", action: "create"}
          ]
        }
    }
  end

  context "context: [POST]/api/roles" do
    it "can create Role and Permission, if user has enough role" do
      role_manager = FactoryBot.create(:role_manager)
      login(role_manager.email, role_manager.password)
      auth_params = get_auth_params_from_login_response_headers(response)

      post api_roles_path, params: @role_params, headers: auth_params

      expect(response.status).to eq(201)
    end

    it "returns unauthorized if user with wrong role and permission try to create Roles and Permissions." do
      non_role_manager = FactoryBot.create(:user_manager)
      login(non_role_manager.email, non_role_manager.password)
      auth_params = get_auth_params_from_login_response_headers(response)

      post api_roles_path, params: @role_params, headers: auth_params

      expect(response.status).to eq(401)
      expect(response.parsed_body["errors"]).to eq("role_policy.create? not authorized")
    end
  end
end
