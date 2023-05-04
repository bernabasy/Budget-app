class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :groups, foreign_key: :author_id
  has_many :entities, foreign_key: :author_id

  # validates :name, :email, :password, presence: true

  validates :name, presence: true, length: { minimum: 0, maximum: 50 }
end
