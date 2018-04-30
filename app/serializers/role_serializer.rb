class RoleSerializer < ActiveModel::Serializer
  attributes :id, :label

  has_many :permissions
end
