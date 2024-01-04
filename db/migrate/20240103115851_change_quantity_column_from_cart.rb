class ChangeQuantityColumnFromCart < ActiveRecord::Migration[7.1]
  def change
    change_column :carts, :quantity, :integer, default: 1
  end
end
