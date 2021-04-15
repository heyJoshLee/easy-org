class Post < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :comments

  validates :title, presence: true, length: { minimum: 3, maximum: 50}, uniqueness: { case_sensitive: false }
  validates :body, presence: true, length: { minimum: 3, maximum: 5000}, uniqueness: { case_sensitive: false }

  def priority_word
    if priority == 4
      "Low"
    elsif priority == 3
      "Medium"
    elsif priority == 2
      "High"
    else
      "Urgent"
    end
  end

  def button_color
    if priority == 4
      "info"
    elsif priority == 3
      "success"
    elsif priority == 2
      "warning"
    else
      "danger"
    end
  end

end