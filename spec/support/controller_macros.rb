module ControllerMacros
  def login_superadmin
    before(:each) do
      # sign_in FactoryBot.create(:user_with_superadmin_roles)
    end
  end
end
