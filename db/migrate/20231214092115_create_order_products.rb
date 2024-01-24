# frozen_string_literal: true

class CreateOrderProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :order_products do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :mrp
      t.string :discount_type
      t.integer :discount_value
      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end
