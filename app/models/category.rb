class Category < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  has_many :user_categories
  has_many :users, through: :user_categories
  has_many :quiz_questions

  validates :name, presence: true, length: { maximum: 30 }
end
