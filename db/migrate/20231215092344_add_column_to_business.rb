# frozen_string_literal: true

# :nodoc
class AddColumnToBusiness < ActiveRecord::Migration[7.1]
  def change
    add_column :businesses, :pincode, :integer
    add_column :businesses, :street, :text
    add_column :businesses, :landmark, :string
  end
end
