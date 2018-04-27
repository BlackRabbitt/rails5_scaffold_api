class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    render json: {errors: "#{policy_name}.#{exception.query} not authorized"}.to_json, status: 401
  end

  def pundit_user
    @current_api_user
  end
end
