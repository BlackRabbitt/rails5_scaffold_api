##
# Role represents the role for user.
#
class Role < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :permissions

  validates :label, uniqueness: true
  validates :label, presence: true
end
