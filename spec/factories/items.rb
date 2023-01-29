FactoryBot.define do
  factory :item do
    name                  { Faker::Book.title }
    description           { Faker::Lorem.sentence }
    price                 { 500 }
    category_id           { 2 }
    status_id             { 2 }
    delivery_fee_id       { 2 }
    prefecture_id         { 2 }
    days_id               { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
