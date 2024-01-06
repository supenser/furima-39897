class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post, :area_id, :area, :detail_area, :building, :telephone, :token
  
  with_options presence: true do
    validates :post, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :area_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :area
    validates :detail_area
    validates :telephone,format: {with: /\A\d{10,11}\z/, message: "is too short"}
    validates :token
  end
  validates :telephone,numericality: {only_integer: true, message: "is invalid. Input only number"}

  def save(params, user_id)
    order = Order.create(item_id: params[:item_id], user_id: user_id)
    Address.create( post: post, area_id: area_id, area: area, detail_area: detail_area, building: building, telephone: telephone, order_id: order.id)
  end

end