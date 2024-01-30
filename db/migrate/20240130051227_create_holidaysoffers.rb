class CreateHolidaysoffers < ActiveRecord::Migration[7.1]
  def change
    create_table :holidaysoffers do |t|
      t.date :date
      t.string :name
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
