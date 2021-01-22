class CreateNotificationChannels < ActiveRecord::Migration[6.0]
  def change
    create_table :notification_channels do |t|
      t.string :name
      t.string :subject_template
      t.string :body_template

      t.timestamps
    end
  end
end
