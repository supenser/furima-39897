class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post, :area_id, :area, :detail_area, :building, :telephone, :order_id
  
  with_options presence: true do
    validates :post, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :area_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :area
    validates :detail_area
    validates :telephone,format: {with: /\A\d{10,11}\z/, message: "is too short"}

  end
  validates :telephone,numericality: {only_integer: true, message: "is invalid. Input only number"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post: post, area_id: area_id, area: area, detail_area: detail_area, building: building, telephone: telephone, order_id: order_id)
  end

end