class AddColumnToBusinesses < ActiveRecord::Migration[7.1]
  def change
    add_column :businesses, :language, :string
  end
end
