class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :entities_groups, dependent: :destroy
  has_many :entities, through: :entities_groups

  has_one_attached :icon
  validates :name, :icon, presence: true
end
