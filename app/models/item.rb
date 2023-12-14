class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_cost
  belongs_to :area
  belongs_to :shipping_date

  validates :image, :item, :item_text, :category, :condition, :delivery_cost, :area, :shipping_date, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_cost_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" }

end
