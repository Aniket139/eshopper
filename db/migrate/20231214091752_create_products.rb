# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :mrp
      t.string :discount_type
      t.integer :discount_value
      t.float :price
      t.string :image
      t.references :category, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.references :business, null: false, foreign_key: true
      t.boolean :active
      t.string :availability

      t.timestamps
    end
  end
end
