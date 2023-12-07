FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.unique.first_name}
    email                 { Faker::Internet.email}
    password = '1' + Faker::Internet.password(min_length: 5)
    password              { password}
    password_confirmation { password}
    last_name             { '小野'}
    first_name            { '萌美'}
    kana_last_name        { 'オノ'}
    kana_first_name       { 'モエミ'}
    date_of_birth         { Faker::Date.birthday(min_age: 5,max_age: 93)}
  end
end