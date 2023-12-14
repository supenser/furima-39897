FactoryBot.define do
  factory :item do

    item              { 'パソコン'}
    item_text         { '最近購入しました'}
    category_id       { '2'}
    condition_id      { '2'}
    delivery_cost_id  { '2'}
    area_id           { '2'}
    shipping_date_id  { '2'}
    price             { '100000'}
  
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/basuke.jpg'), filename: 'basuke.jpg')
    end
  end
end
