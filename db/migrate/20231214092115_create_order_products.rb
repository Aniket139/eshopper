# frozen_string_literal: true

# :nodoc
class CreateOrderProducts < ActiveRecord::Migration[7.1]
  # rubocop:disable Metrics/MethodLength
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
  # rubocop:enable Metrics/MethodLength
end
