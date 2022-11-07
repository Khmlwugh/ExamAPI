class Question < ApplicationRecord
  belongs_to :user
  belongs_to :exam
  belongs_to :category
end
