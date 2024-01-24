# frozen_string_literal: true

class AddCloumnToOrders < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :date, :date
    add_column :orders, :cancel_by, :string
    add_column :orders, :cancel_reason, :string
    add_column :orders, :delivery_notes, :string
    add_column :orders, :payment_details, :string
    add_column :orders, :sub_total, :decimal
    add_column :orders, :discount_type, :string
    add_column :orders, :discount_value, :decimal
    add_column :orders, :total, :decimal
  end
end
