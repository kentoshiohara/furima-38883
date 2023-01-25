class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  PASSWORD_REGIX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  # validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true,
  length: { minimum:6, allow_blank: true}, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "is invalid. Include both letters and numbers" }
  validates :password_confirmation, presence: true
  validates :nickname, presence: true
  validates :family_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
  validates :family_name_kana, presence: true, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
  validates :date_of_birth, presence: true

end
