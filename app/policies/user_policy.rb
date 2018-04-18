class UserPolicy
  attr_reader :current_user, :user

  def initialize(current_user, role)
    @current_user = current_user
    @role = role
  end

  def create?
    current_user.nil? ? false : current_user.super_admin?
  end
end
