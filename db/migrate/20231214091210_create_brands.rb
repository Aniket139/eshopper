# frozen_string_literal: true

class CreateBrands < ActiveRecord::Migration[7.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.text :description
      t.references :business, null: false, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
