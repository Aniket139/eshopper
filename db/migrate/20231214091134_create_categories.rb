# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name, limit: 20
      t.text :description, limit: 100
      t.references :business, null: false, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
