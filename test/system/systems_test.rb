require "application_system_test_case"

class SystemsTest < ApplicationSystemTestCase
  setup do
    @system = systems(:one)
  end

  test "visiting the index" do
    visit systems_url
    assert_selector "h1", text: "Systems"
  end

  test "creating a System" do
    visit systems_url
    click_on "New System"

    fill_in "Boot Time", with: @system.boot_time
    fill_in "Cpu", with: @system.cpu
    fill_in "Date", with: @system.date
    fill_in "Drives", with: @system.drives
    fill_in "Graphics", with: @system.graphics
    fill_in "Ip", with: @system.ip
    fill_in "Machine", with: @system.machine
    fill_in "Server", with: @system.server_id
    fill_in "System", with: @system.system
    click_on "Create System"

    assert_text "System was successfully created"
    click_on "Back"
  end

  test "updating a System" do
    visit systems_url
    click_on "Edit", match: :first

    fill_in "Boot Time", with: @system.boot_time
    fill_in "Cpu", with: @system.cpu
    fill_in "Date", with: @system.date
    fill_in "Drives", with: @system.drives
    fill_in "Graphics", with: @system.graphics
    fill_in "Ip", with: @system.ip
    fill_in "Machine", with: @system.machine
    fill_in "Server", with: @system.server_id
    fill_in "System", with: @system.system
    click_on "Update System"

    assert_text "System was successfully updated"
    click_on "Back"
  end

  test "destroying a System" do
    visit systems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "System was successfully destroyed"
  end
end
