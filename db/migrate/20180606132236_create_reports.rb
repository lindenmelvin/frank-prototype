class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :serial_number
      t.string :photo
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
