class Api::Overrides::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :authenticate_api_user!
  before_action :authorize_user, only: [:create]

  private
  ##
  # authorize the user and return true only if the role is super_admin
  #
  def authorize_user
    authorize User.new
  end
end
