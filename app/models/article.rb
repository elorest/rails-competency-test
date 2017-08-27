class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true

  scope :first_three_from_each_category, -> do 
    all.group_by {|a| a.category }.map {|i| i.first(3) }.to_h 
  end 
end
