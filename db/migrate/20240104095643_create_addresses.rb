class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :post        , null: false
      t.integer :area_id    , null: false
      t.string :area        , null: false
      t.string :detail_area , null: false
      t.string :building
      t.string :telephone   , null: false
      t.references :order   , null: false, foreign_key: true

      t.timestamps
    end
  end
end
