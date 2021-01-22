require 'test_helper'

class NotificationPermissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notification_permission = notification_permissions(:one)
  end

  test "should get index" do
    get notification_permissions_url
    assert_response :success
  end

  test "should get new" do
    get new_notification_permission_url
    assert_response :success
  end

  test "should create notification_permission" do
    assert_difference('NotificationPermission.count') do
      post notification_permissions_url, params: { notification_permission: { channel_id: @notification_permission.channel_id, email: @notification_permission.email, local: @notification_permission.local, user_id: @notification_permission.user_id } }
    end

    assert_redirected_to notification_permission_url(NotificationPermission.last)
  end

  test "should show notification_permission" do
    get notification_permission_url(@notification_permission)
    assert_response :success
  end

  test "should get edit" do
    get edit_notification_permission_url(@notification_permission)
    assert_response :success
  end

  test "should update notification_permission" do
    patch notification_permission_url(@notification_permission), params: { notification_permission: { channel_id: @notification_permission.channel_id, email: @notification_permission.email, local: @notification_permission.local, user_id: @notification_permission.user_id } }
    assert_redirected_to notification_permission_url(@notification_permission)
  end

  test "should destroy notification_permission" do
    assert_difference('NotificationPermission.count', -1) do
      delete notification_permission_url(@notification_permission)
    end

    assert_redirected_to notification_permissions_url
  end
end
