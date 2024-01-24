# frozen_string_literal: true

class CreateStates < ActiveRecord::Migration[7.1]
  def change
    create_table :states do |t|
      t.references :country, null: false, foreign_key: true
      t.string :name, limit: 20
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
