Rails.application.routes.draw do
  namespace :api, default: {format: :json} do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
end
