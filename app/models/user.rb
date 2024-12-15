class User < ApplicationRecord
  has_many :user_categories
  has_many :categories, through: :user_categories

  has_secure_password

  validates :name, presence: true, length: { maximum: 100 }

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w\-\._]+@[\w\-\._]+\.[A-Za-z]+\z/
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }

  VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*?\d)[\w]+\z/
  VALID_PASSWORD_MESSAGE_HANKAKU = "は半角英数字で入力してください"
  VALID_PASSWORD_MESSAGE_MINLENGTH = "は8文字以上で入力してください"
  VALID_PASSWORD_MESSAGE_MAXLENGTH = "は16文字以内で入力してください"
  validates :password, presence: true
  validate :validate_password

  validates :auth0_id, uniqueness: true, allow_nil: true

  private

  def validate_password
    if password.present?
      errors.add(:password, VALID_PASSWORD_MESSAGE_HANKAKU) unless password =~ VALID_PASSWORD_REGEX
      errors.add(:password, VALID_PASSWORD_MESSAGE_MINLENGTH) unless password.length >= 8
      errors.add(:password, VALID_PASSWORD_MESSAGE_MAXLENGTH) unless password.length <= 16
    end
  end

  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]

    self.find_or_create_by(provider: provider, uid: uid) do |user|
      user.email = auth[:info][:email]
    end
  end
end
