class Api::V1::PermissionsController < ApplicationController
  before_action :authenticate_api_user!
  before_action :define_role, only: :create
  after_action :verify_authorized

  def create
    permissions = @role.permissions.new(permissions_params[:permissions])
    authorize @role
    if @role.save
      render json: {records: permissions, message: "Permissions defined for role"}.to_json, status: 201
    end
  end

  private
  def permissions_params
    params.permit(:permissions => [:resource_type, :action])
  end

  def define_role
    @role = Role.find(params[:role_id])
  end
end
