class RolePolicy
  attr_reader :user, :role

  def initialize(user, role)
    @user = user
    @role = role
  end

  def create?
    false
    # user.super_admin?
  end
end
