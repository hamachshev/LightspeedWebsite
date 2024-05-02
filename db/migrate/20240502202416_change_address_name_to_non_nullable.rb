class ChangeAddressNameToNonNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_default :addresses, :name, ""
    change_column_null :addresses, :name, false, ""
  end
end
