class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :entities_groups, dependent: :destroy
  has_many :groups, through: :entities_groups
end
