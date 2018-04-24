class Organization < ApplicationRecord
  after_create :create_tenant

  private
  def create_tenant
    # create new tenant for each organization based on subdomain
    Apartment::Tenant.create(subdomain)
  end
end
