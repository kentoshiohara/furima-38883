class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :days
  belongs_to :user
  has_one_attached :image
  has_one :order

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :name
    validates :description
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, allow_blank: true}
    validates :image
  end

  # ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, :status_id, :delivery_fee_id, :prefecture_id, :days_id,
            numericality: { other_than: 1, message: "を入力してください" }
end
