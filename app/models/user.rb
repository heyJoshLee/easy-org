class User < ApplicationRecord
  before_save { self.email = email.downcase }
  before_save { self.username = username.downcase }

  has_many :posts
  has_many :organization_users
  has_many :organizations, through: :organization_users
  has_many :comments
  has_many :messages
  
  validates :username, presence: true, length: { minimum: 3, maximum: 15}, uniqueness: { case_sensitive: false }
  validates :email, presence: true, length: { minimum: 3, maximum: 50}, uniqueness: { case_sensitive: false }
  has_secure_password

end