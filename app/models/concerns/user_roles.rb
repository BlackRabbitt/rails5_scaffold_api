module UserRoles
  def super_admin?
    self.roles.where(label: 'super_admin').exists?
  end
end
