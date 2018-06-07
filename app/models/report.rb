class Report < ApplicationRecord
  FIELDS = [
    { name: :name, display: "Name", type: :text_field },
    { name: :email, display: "Email", type: :text_field },
    { name: :phone, display: "Phone", type: :text_field },
    { name: :district, display: "District", type: :text_field },
    { name: :location, display: "Location", type: :text_field },
    { name: :make, display: "Make", type: :text_field },
    { name: :model, display: "Model", type: :text_field },
    { name: :size, display: "Size", type: :text_field },
    { name: :serial_number, display: "Serial Number", type: :text_field },
    { name: :valve_type, display: "Type", type: :text_field },
    { name: :meter, display: "Meter", type: :text_field },
    { name: :time, display: "Time", type: :date_field },
    { name: :psi, display: "PSI", type: :number_field },
    { name: :check1, display: "Check 1", type: :text_field },
    { name: :check2, display: "Check 2", type: :text_field },
    { name: :opening, display: "Opening", type: :text_field },
    { name: :actual, display: "Actual", type: :text_field },
    { name: :notes, display: "Notes", type: :text_area },
    { name: :photo, display: "Photo", type: :file_field }
  ]

  belongs_to :address, dependent: :destroy
  accepts_nested_attributes_for :address
  mount_uploader :photo, PhotoUploader
end
