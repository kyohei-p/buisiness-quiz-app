class Quiz::Answer < ApplicationRecord
  belongs_to :quiz_question, class_name: 'Quiz::Question'

  validates :explanation, length: { maximum: 300 }, allow_nil: true
end
