class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, allow_blank: true}
  validates :nickname, presence: true
  validates :family_name, presence: true,
                          format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true}
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true}
  validates :family_name_kana, presence: true,
                               format: { with: /\A[ァ-ヶー]+\z/, allow_blank: true}
  validates :first_name_kana, presence: true,
                              format: { with: /\A[ァ-ヶー]+\z/, allow_blank: true}
  validates :date_of_birth, presence: true
end
