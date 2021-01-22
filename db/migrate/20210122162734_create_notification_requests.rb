class CreateNotificationRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :notification_requests do |t|
      t.references :channel, null: false, foreign_key: true
      t.text :params

      t.timestamps
    end
  end
end
