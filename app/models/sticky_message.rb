class StickyMessage < ApplicationRecord
  belongs_to :sticky, polymorphic: true
  belongs_to :user
  validates :title, presence: true, length: { minimum: 3, maximum: 50}, uniqueness: { case_sensitive: false }
  validates :body, presence: true, length: { minimum: 3, maximum: 5000}, uniqueness: { case_sensitive: false }
  validates :user, presence: true
end