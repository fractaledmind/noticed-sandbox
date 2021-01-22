require "application_system_test_case"

class NotificationPermissionsTest < ApplicationSystemTestCase
  setup do
    @notification_permission = notification_permissions(:one)
  end

  test "visiting the index" do
    visit notification_permissions_url
    assert_selector "h1", text: "Notification Permissions"
  end

  test "creating a Notification permission" do
    visit notification_permissions_url
    click_on "New Notification Permission"

    fill_in "Channel", with: @notification_permission.channel_id
    check "Email" if @notification_permission.email
    check "Local" if @notification_permission.local
    fill_in "User", with: @notification_permission.user_id
    click_on "Create Notification permission"

    assert_text "Notification permission was successfully created"
    click_on "Back"
  end

  test "updating a Notification permission" do
    visit notification_permissions_url
    click_on "Edit", match: :first

    fill_in "Channel", with: @notification_permission.channel_id
    check "Email" if @notification_permission.email
    check "Local" if @notification_permission.local
    fill_in "User", with: @notification_permission.user_id
    click_on "Update Notification permission"

    assert_text "Notification permission was successfully updated"
    click_on "Back"
  end

  test "destroying a Notification permission" do
    visit notification_permissions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Notification permission was successfully destroyed"
  end
end
