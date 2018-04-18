class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :nickname

  has_many :roles
end
