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
