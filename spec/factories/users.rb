FactoryBot.define do
  factory :user do
    nickname   { Faker::Name.name }
    email      { Faker::Internet.free_email }
    password { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    date_of_birth { '1989-07-23' }
  end
end
