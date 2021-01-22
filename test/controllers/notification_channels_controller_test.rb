require 'test_helper'

class NotificationChannelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notification_channel = notification_channels(:one)
  end

  test "should get index" do
    get notification_channels_url
    assert_response :success
  end

  test "should get new" do
    get new_notification_channel_url
    assert_response :success
  end

  test "should create notification_channel" do
    assert_difference('NotificationChannel.count') do
      post notification_channels_url, params: { notification_channel: { body_template: @notification_channel.body_template, name: @notification_channel.name, subject_template: @notification_channel.subject_template } }
    end

    assert_redirected_to notification_channel_url(NotificationChannel.last)
  end

  test "should show notification_channel" do
    get notification_channel_url(@notification_channel)
    assert_response :success
  end

  test "should get edit" do
    get edit_notification_channel_url(@notification_channel)
    assert_response :success
  end

  test "should update notification_channel" do
    patch notification_channel_url(@notification_channel), params: { notification_channel: { body_template: @notification_channel.body_template, name: @notification_channel.name, subject_template: @notification_channel.subject_template } }
    assert_redirected_to notification_channel_url(@notification_channel)
  end

  test "should destroy notification_channel" do
    assert_difference('NotificationChannel.count', -1) do
      delete notification_channel_url(@notification_channel)
    end

    assert_redirected_to notification_channels_url
  end
end
