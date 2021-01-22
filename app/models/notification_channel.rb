class NotificationChannel < ApplicationRecord
  def to_noticed_class
    channel_subject_template = subject_template
    channel_body_template = body_template

    klass = Class.new(Noticed::Base) do
      deliver_by :database

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

