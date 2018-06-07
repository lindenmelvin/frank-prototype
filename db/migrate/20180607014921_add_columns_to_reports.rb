class AddColumnsToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :district, :string
    add_column :reports, :address_id, :integer
    add_column :reports, :location, :string
    add_column :reports, :make, :string
    add_column :reports, :model, :string
    add_column :reports, :size, :string
    add_column :reports, :valve_type, :string
    add_column :reports, :meter, :string
    add_column :reports, :time, :datetime
    add_column :reports, :psi, :integer
    add_column :reports, :check1, :string
    add_column :reports, :check2, :string
    add_column :reports, :opening, :string
    add_column :reports, :actual, :string
    add_column :reports, :notes, :text

    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :city
      t.string :state
      t.string :postal_code

      t.timestamps
    end
  end
end
