require "application_system_test_case"

class NotificationRequestsTest < ApplicationSystemTestCase
  setup do
    @notification_request = notification_requests(:one)
  end

  test "visiting the index" do
    visit notification_requests_url
    assert_selector "h1", text: "Notification Requests"
  end

  test "creating a Notification request" do
    visit notification_requests_url
    click_on "New Notification Request"

    fill_in "Channel", with: @notification_request.channel_id
    fill_in "Params", with: @notification_request.params
    click_on "Create Notification request"

    assert_text "Notification request was successfully created"
    click_on "Back"
  end

  test "updating a Notification request" do
    visit notification_requests_url
    click_on "Edit", match: :first

    fill_in "Channel", with: @notification_request.channel_id
    fill_in "Params", with: @notification_request.params
    click_on "Update Notification request"

    assert_text "Notification request was successfully updated"
    click_on "Back"
  end

  test "destroying a Notification request" do
    visit notification_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Notification request was successfully destroyed"
  end
end
