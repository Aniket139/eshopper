# frozen_string_literal: true

class RemoveUnuseColumnFromcarts < ActiveRecord::Migration[7.1]
  def change
    remove_column :carts, :mrp, :integer
    remove_column :carts, :discount_type, :string
    remove_column :carts, :discount_value, :integer
    remove_column :carts, :price, :float
  end
end
