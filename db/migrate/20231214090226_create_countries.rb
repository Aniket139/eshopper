class CreateCountries < ActiveRecord::Migration[7.1]
  def change
    create_table :countries do |t|
      t.string :name, limit: 20
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
