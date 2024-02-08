# frozen_string_literal: true

class AddDobToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :dob, :date
  end
end
