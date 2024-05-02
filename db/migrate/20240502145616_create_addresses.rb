class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :address_line1
      t.string :address_line2
      t.string :zone_code
      t.string :zipcode
      t.string :country_code, default: "US"

      t.timestamps
    end
  end
end
