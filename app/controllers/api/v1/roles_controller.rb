class Api::V1::RolesController < ApplicationController
  before_action :authenticate_api_user!
  after_action :verify_authorized

  def create
    role = Role.new(label: roles_params[:label])
    authorize role
    if role.save
      render json: {record: role, message: "roles record created successfully"}.to_json, status: 201
    end
  end

  private
  def roles_params
    params.require(:roles).permit(:label)
  end
end
