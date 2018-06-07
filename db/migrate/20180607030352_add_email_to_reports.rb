class AddEmailToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :name, :string
    add_column :reports, :email, :string
    add_column :reports, :phone, :string
  end
end
