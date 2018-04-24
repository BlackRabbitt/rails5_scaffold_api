class Api::V1::OrganizationsController < ApplicationController
  def create
    org = Organization.new(organization_params)
    if org.save
      render json: {record: org, message: "organization with its own tenant created successfully"}.to_json, status: 201
    end
  end

  private
  def organization_params
    params.require(:organization).permit(:name, :subdomain)
  end
end
