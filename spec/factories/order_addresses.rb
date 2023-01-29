FactoryBot.define do
  factory :order_address do
    token          { 'tok_abcdefghijk00000000000000000' }
    postal_code    { '000-0000' }
    prefecture_id  { 2 }
    city           { Faker::Address.city }
    district       { Faker::Address.street_address }
    tel            { '0000000000' }

    association :user_id
    association :item_id
  end
end
