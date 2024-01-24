# frozen_string_literal: true

class CreateCarts < ActiveRecord::Migration[7.1]
  def change
    create_table :carts do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.integer :mrp
      t.string :discount_type
      t.integer :discount_value
      t.float :price

      t.timestamps
    end
  end
end
