# frozen_string_literal: true

# :nodoc
class CreateBusinesses < ActiveRecord::Migration[7.1]
  def change
    create_table :businesses do |t|
      t.string :name, limit: 20
      t.references :city, null: false, foreign_key: true
      t.references :state, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true
      t.string :email
      t.string :mobile, limit: 25

      t.timestamps
    end
  end
end
