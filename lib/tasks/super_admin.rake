namespace :super_admin do
  task create: :environment do
    # tenant_name is the organization Name
    # super_admin for each tenant
    Apartment::Tenant.switch('tenant_name') do
      u = User.new(email: "admin@gmail.com", password: 'password@123')
      u.roles.new(label: 'super_admin')
      u.save
    end
  end
end
