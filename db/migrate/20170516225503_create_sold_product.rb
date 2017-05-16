class CreateSoldProduct < ActiveRecord::Migration
  def change
    create_table :sold_products do |t|
      t.string :buyer_name
      t.text :description
      t.decimal :price
      t.integer :quantity
      t.string :address
      t.string :provider_name
    end
  end
end
