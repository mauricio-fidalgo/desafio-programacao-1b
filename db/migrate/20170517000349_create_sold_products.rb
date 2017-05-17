class CreateSoldProducts < ActiveRecord::Migration
  def change
    create_table :sold_products do |t|

      t.timestamps
    end
  end
end
