# frozen_string_literal: true

class DropHolidaysoffer < ActiveRecord::Migration[7.1]
  def change
    drop_table :holidaysoffers
  end
end
