##
# Organization is the main client of the product. Product is distributed among several organization and seperates them with subdomain.
# After organization is created, apartment gem callback will be called that creates different schema for the organization to achieve multitency architecture.
#
class Organization < ApplicationRecord
  after_create :create_tenant

  validates :subdomain, uniqueness: true
  validates :name, :subdomain, presence: true

  private
  def create_tenant
    # create new tenant for each organization based on subdomain
    Apartment::Tenant.create(subdomain)
  end
end
