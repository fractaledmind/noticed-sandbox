class CreateNotificationRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :notification_requests do |t|
      t.references :channel, null: false
      t.text :params

      t.timestamps
    end

    add_foreign_key :notification_requests, :notification_channels, column: :channel_id
  end
end
