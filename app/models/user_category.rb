class UserCategory < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  belongs_to :user
  belongs_to :category

  validates :user_id, uniqueness: { scope: :category_id }
end
