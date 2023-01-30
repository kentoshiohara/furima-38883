class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :district, :building, :tel, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, allow_blank: true}
    validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください", allow_blank: true}
    validates :city
    validates :district
    validates :tel, format: { with: /\A[0-9]{10,11}\z/, allow_blank: true }
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, district: district, building: building,
                   tel: tel, order_id: order.id)
  end
end
