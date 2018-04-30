module UserRoles
  def can?(action:,resource_type:)
    role = self.roles.where("id in (select role_id from permissions_roles pr where pr.permission_id in (select id from permissions p where p.resource_type='#{resource_type}' and p.action='#{action}'))").first
    role.nil? ? false : true
  end
end
