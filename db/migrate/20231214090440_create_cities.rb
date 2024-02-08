# frozen_string_literal: true

# :nodoc
class CreateCities < ActiveRecord::Migration[7.1]
  def change
    create_table :cities do |t|
      t.references :state, null: false, foreign_key: true
      t.string :name, limit: 20
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
