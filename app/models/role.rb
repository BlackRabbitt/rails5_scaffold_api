class Role < ApplicationRecord
  has_and_belongs_to_many :users

  validates :label, uniqueness: true
  validates :label, presence: true
end
