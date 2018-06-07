class Address < ApplicationRecord
  FIELDS = [
    { name: :line1, display: "Address Line 1", type: :text_field },
    { name: :line2, display: "Address Line 2", type: :text_field },
    { name: :city, display: "City", type: :text_field },
    { name: :state, display: "State", type: :text_field },
    { name: :postal_code, display: "Postal Code", type: :text_field },
  ]
end
