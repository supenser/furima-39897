FactoryBot.define do
  factory :order_address do


    post            { '123-4567'}
    area_id         { '2'}
    area            { '札幌市中央区'}
    detail_area     { '北2条西4丁目'}
    building        { '赤レンガテラス'}
    telephone       { '09011112222'}


    association :user_id
    association :item_id
    
  end
end