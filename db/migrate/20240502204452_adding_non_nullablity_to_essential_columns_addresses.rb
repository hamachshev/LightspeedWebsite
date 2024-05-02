class AddingNonNullablityToEssentialColumnsAddresses < ActiveRecord::Migration[7.0]
  def change
    change_column_null :addresses, :city, false, ""
    change_column_null :addresses, :address_line1, false, ""
    change_column_null :addresses, :zone_code, false, ""
    change_column_null :addresses, :zipcode, false, ""
    change_column_null :addresses, :country_code, false #already has a default
  end
end
