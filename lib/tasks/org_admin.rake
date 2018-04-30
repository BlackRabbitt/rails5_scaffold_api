namespace :org_admin do
  task create: :environment do
    # tenant_name is the organization Name
    # super_admin for each tenant
    Apartment::Tenant.switch('beetle') do
      r = Role.new(label: "admin")
      r.permissions.new([{resource_type: "User", action: "create"}, {resource_type: "Role", action: "create"}, {resource_type: "Permission", action: "create"}])
      r.save

      u = User.new(email: "admin@gmail.com", password: 'password@123')
      u.roles << r
      u.save
    end
  end
end
