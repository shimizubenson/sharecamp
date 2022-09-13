class CreateOrderInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :order_informations do |t|
      t.string       :post_code,          null: false
      t.integer      :region_id,          null: false
      t.string       :city,               null: false
      t.string       :address,            null: false
      t.string       :building_name     
      t.string       :phone_number,       null: false
      t.integer      :rental_days_id,     null: false
      t.references   :rental,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
