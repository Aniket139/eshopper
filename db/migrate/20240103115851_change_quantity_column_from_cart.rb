# frozen_string_literal: true

# :nodoc
class ChangeQuantityColumnFromCart < ActiveRecord::Migration[7.1]
  def change
    change_column :carts, :quantity, :integer, default: 1
  end
end
