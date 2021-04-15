class Organization < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :organization_users
  has_many :users, through: :organization_users
  validates :name, presence: true, length: { minimum: 3, maximum: 15}
  has_many :sticky_messages, as: :sticky, dependent: :destroy
end