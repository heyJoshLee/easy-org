class Project < ApplicationRecord
  belongs_to :organization
  has_many :posts
  has_many :messages, dependent: :destroy
  has_many :sticky_messages, as: :sticky, dependent: :destroy
end