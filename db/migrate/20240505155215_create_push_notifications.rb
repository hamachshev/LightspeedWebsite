class CreatePushNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :push_notifications do |t|
      t.string :title
      t.string :body
      t.integer :badge
      t.string :sound

      t.timestamps
    end
  end
end
