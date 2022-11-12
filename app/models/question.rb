class Question < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :exam
  belongs_to :category
end
