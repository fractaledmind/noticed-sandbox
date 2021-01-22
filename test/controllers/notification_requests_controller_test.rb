require 'test_helper'

class NotificationRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notification_request = notification_requests(:one)
  end

  test "should get index" do
    get notification_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_notification_request_url
    assert_response :success
  end

  test "should create notification_request" do
    assert_difference('NotificationRequest.count') do
      post notification_requests_url, params: { notification_request: { channel_id: @notification_request.channel_id, params: @notification_request.params } }
    end

    assert_redirected_to notification_request_url(NotificationRequest.last)
  end

  test "should show notification_request" do
    get notification_request_url(@notification_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_notification_request_url(@notification_request)
    assert_response :success
  end

  test "should update notification_request" do
    patch notification_request_url(@notification_request), params: { notification_request: { channel_id: @notification_request.channel_id, params: @notification_request.params } }
    assert_redirected_to notification_request_url(@notification_request)
  end

  test "should destroy notification_request" do
    assert_difference('NotificationRequest.count', -1) do
      delete notification_request_url(@notification_request)
    end

    assert_redirected_to notification_requests_url
  end
end
