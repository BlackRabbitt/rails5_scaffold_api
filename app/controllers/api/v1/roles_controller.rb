class Api::V1::RolesController < ApplicationController
  before_action :authenticate_api_user!
  after_action :verify_authorized

  def create
    existing_role = Role.where(label: roles_params[:label]).first
    render json: {record: existing_role, message: "record already exist"}.to_json, status: 201 unless existing_role.nil?

    role = Role.new(label: roles_params[:label])
    authorize role

    roles_params[:permissions].each do |permission|
      existing_permission = Permission.where(permission).first

      if existing_permission.nil?
        role.permissions << Permission.new(permission)
      else
        role.permissions << existing_permission
      end
    end

    if role.save
      render json: {record: role, message: "record created successfully"}.to_json, status: 201
    else
      render json: {errors: role.errors}.to_json, status: 422
    end
  end

  private
  def roles_params
    params.require(:role).permit(:label, :permissions => [:resource_type, :action])
  end
end
