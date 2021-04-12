class User < ApplicationRecord
  has_many :posts
  has_many :organization_users
  has_many :organizations, through: :organization_users
  validates :username, presence: true, length: { minimum: 3, maximum: 15}, uniqueness: { case_sensitive: false }
  validates :email, presence: true, length: { minimum: 3, maximum: 50}, uniqueness: { case_sensitive: false }
  has_secure_password
end