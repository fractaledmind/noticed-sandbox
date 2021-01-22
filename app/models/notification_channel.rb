class NotificationChannel < ApplicationRecord
  def to_noticed_class
    channel_subject_template = subject_template
    channel_body_template = body_template
    channel_id = id

    klass = Class.new(Noticed::Base) do
      deliver_by :database, if: :local_notifications?

      define_method :local_notifications? do
        recipient.notification_permissions.find_by(channel_id: channel_id)&.local? || true
      end

      define_method :subject do
        channel_subject_template % params.symbolize_keys
      end

      define_method :body do
        channel_body_template % params.symbolize_keys
      end
    end

    Object.const_set "#{name}Notifier", klass
  end
end

