module Notifications
  class Channel < ApplicationRecord
    self.table_name = :notification_channels

    def to_noticed_class
      channel_subject_template = subject_template
      channel_body_template = body_template
      channel_id = id

      klass = Class.new(Noticed::Base) do
        deliver_by :database, if: :local_notifications?, format: :some_format_method
        deliver_by :email, mailer: "NotificationMailer", if: :email_notifications?

        define_method :local_notifications? do
          preference = preferences&.local?

          return preference unless preference.nil?

          true
        end

        define_method :email_notifications? do
          preference = preferences&.email?

          return preference unless preference.nil?

          true
        end

        define_method :subject do
          channel_subject_template % attributes
        end

        define_method :body do
          channel_body_template % attributes
        end

        define_method :preferences do
          recipient.notification_preferences.find_by(channel_id: channel_id)
        end

        define_method :attributes do
          original = params.symbolize_keys
          Hash.new { |_, k| original[k] || '' }
        end
      end

      Object.const_set "#{name}Notifier", klass
    end
  end
end
