require "application_system_test_case"

class NotificationChannelsTest < ApplicationSystemTestCase
  setup do
    @notification_channel = notification_channels(:one)
  end

  test "visiting the index" do
    visit notification_channels_url
    assert_selector "h1", text: "Notification Channels"
  end

  test "creating a Notification channel" do
    visit notification_channels_url
    click_on "New Notification Channel"

    fill_in "Body template", with: @notification_channel.body_template
    fill_in "Name", with: @notification_channel.name
    fill_in "Subject template", with: @notification_channel.subject_template
    click_on "Create Notification channel"

    assert_text "Notification channel was successfully created"
    click_on "Back"
  end

  test "updating a Notification channel" do
    visit notification_channels_url
    click_on "Edit", match: :first

    fill_in "Body template", with: @notification_channel.body_template
    fill_in "Name", with: @notification_channel.name
    fill_in "Subject template", with: @notification_channel.subject_template
    click_on "Update Notification channel"

    assert_text "Notification channel was successfully updated"
    click_on "Back"
  end

  test "destroying a Notification channel" do
    visit notification_channels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Notification channel was successfully destroyed"
  end
end
