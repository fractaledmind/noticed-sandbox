class CreateNotificationPermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :notification_permissions do |t|
      t.references :channel, null: false
      t.references :user, null: false, foreign_key: true
      t.boolean :local
      t.boolean :email

      t.timestamps
    end
    add_foreign_key :notification_permissions, :notification_channels, column: :channel_id
  end
end
