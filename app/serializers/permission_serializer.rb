class PermissionSerializer < ActiveModel::Serializer
  attributes :id, :resource_type, :action
end
