class Quiz::Answer < ApplicationRecord
  belongs_to :quiz_question, class_name: 'Quiz::Question'
end
