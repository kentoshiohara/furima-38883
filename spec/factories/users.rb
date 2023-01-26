FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation { password }
    family_name           { gimei.last.kanji }
    first_name            { gimei.first.kanji }
    family_name_kana      { gimei.last.katakana }
    first_name_kana       { gimei.first.katakana }
    date_of_birth         { Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end
