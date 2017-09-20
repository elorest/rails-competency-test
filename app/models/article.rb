class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true

  scope :first_three_from_each_category, -> do 
    pluck(:category).uniq.map do |cat|
      [cat, where(category: cat).limit(3)]
    end.to_h
  end 
end
