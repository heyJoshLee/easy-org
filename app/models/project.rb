class Project < ApplicationRecord
  belongs_to :organization
  has_many :posts
  has_many :messages
  has_many :sticky_messages, as: :sticky
end