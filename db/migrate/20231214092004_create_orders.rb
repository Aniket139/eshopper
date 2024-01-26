# frozen_string_literal: true

# :nodoc
class CreateOrders < ActiveRecord::Migration[7.1]
  # rubocop:disable Metrics/MethodLength
  def change
    create_table :orders do |t|
      t.date :date
      t.references :customer, null: false, foreign_key: true
      t.text :street, limit: 100
      t.integer :pincode
      t.string :landmark
      t.references :city, null: false, foreign_key: true
      t.references :state, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true
      t.string :mobile, limit: 25
      t.string :status
      t.string :payment_method

      t.timestamps
    end
  end
  # rubocop:enable Metrics/MethodLength
end
