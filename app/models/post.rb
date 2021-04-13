class Post < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :comments

  validates :title, presence: true, length: { minimum: 3, maximum: 50}, uniqueness: { case_sensitive: false }
  validates :body, presence: true, length: { minimum: 3, maximum: 5000}, uniqueness: { case_sensitive: false }


  def button_color
    if priority == "Low"
      "info"
    elsif priority == "Medium"
      "success"
    elsif priority == "Higg"
      "warning"
    else
      "danger"
    end
  end

end