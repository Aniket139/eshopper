# frozen_string_literal: true

# :nodoc
class CreateCustomers < ActiveRecord::Migration[7.1]
  # rubocop:disable Metrics/MethodLength
  def change
    create_table :customers do |t|
      t.string :first_name, limit: 50
      t.string :middle_name, limit: 50
      t.string :last_name, limit: 50
      t.string :email, limit: 50
      t.string :mobile, limit: 25
      t.text :street, limit: 100
      t.string :landmark, limit: 50
      t.integer :pincode
      t.references :city, null: false, foreign_key: true
      t.references :state, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true
      t.references :business, null: false, foreign_key: true
      t.string :password, limit: 50
      t.string :conform_password, limit: 50

      t.timestamps
    end
  end
  # rubocop:enable Metrics/MethodLength
end
