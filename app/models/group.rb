class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  attribute :user_id, :integer

  has_many :group_entities, dependent: :destroy
  has_many :entities, through: :group_entities


  has_one_attached :icon
  validates :name, :icon, presence: true
end
