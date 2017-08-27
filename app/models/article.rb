class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true

  scope :three_from_each_category, -> { all.group_by(:category) }
end
