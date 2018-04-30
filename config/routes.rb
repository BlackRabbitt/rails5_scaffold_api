require 'api_constraints'
require 'subdomain_constraints'

Rails.application.routes.draw do

  # Api routes placed here
  def api_version(version, default, &routes)
    api_constraint = ApiConstraints.new(version: version, default: default)
    scope module: "v#{version}", constraints: api_constraint, &routes
  end

  namespace :api, default: {format: :json} do
    api_version(1, true) do
      constraints SubdomainConstraint do
        mount_devise_token_auth_for 'User', at: 'auth', controllers: { registrations: "api/overrides/registrations" }

        resources :roles, only: :create
        resources :permissions, only: :create
      end

      resources :organizations, only: :create
    end
  end
end
