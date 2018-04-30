class ApplicationController < ActionController::API
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit
  include PunditSupport
end
