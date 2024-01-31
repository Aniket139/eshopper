# frozen_string_literal: true

class CreateHolidays < ActiveRecord::Migration[7.1]
  def change
    create_table :holidays do |t|
      t.date :date
      t.string :name
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
