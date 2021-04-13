class Project < ApplicationRecord
  belongs_to :organization
  has_many :posts
  has_many :messages
end