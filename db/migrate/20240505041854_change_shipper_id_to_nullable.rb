class ChangeShipperIdToNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :orders, :shipper_id, true
  end
end
