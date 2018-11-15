require "application_system_test_case"

class ServersTest < ApplicationSystemTestCase
  setup do
    @server = servers(:one)
  end

  test "visiting the index" do
    visit servers_url
    assert_selector "h1", text: "Servers"
  end

  test "creating a Server" do
    visit servers_url
    click_on "New Server"

    fill_in "Application Director", with: @server.application_director_id
    fill_in "Application Manager", with: @server.application_manager_id
    fill_in "Application Sme", with: @server.application_sme_id
    fill_in "Application Team Distro Group", with: @server.application_team_distro_group
    fill_in "Approved", with: @server.approved
    fill_in "Asset", with: @server.asset
    fill_in "Disk Size", with: @server.disk_size
    fill_in "Eng Team Manager Contact", with: @server.eng_team_manager_contact_id
    fill_in "Eng Team Sme Contact", with: @server.eng_team_sme_contact_id
    fill_in "Environment", with: @server.environment
    fill_in "Hostname", with: @server.hostname
    fill_in "Line Of Business", with: @server.line_of_business
    fill_in "Location", with: @server.location
    fill_in "Os Requested", with: @server.os_requested
    fill_in "User", with: @server.user_id
    fill_in "Virtual Machine", with: @server.virtual_machine
    click_on "Create Server"

    assert_text "Server was successfully created"
    click_on "Back"
  end

  test "updating a Server" do
    visit servers_url
    click_on "Edit", match: :first

    fill_in "Application Director", with: @server.application_director_id
    fill_in "Application Manager", with: @server.application_manager_id
    fill_in "Application Sme", with: @server.application_sme_id
    fill_in "Application Team Distro Group", with: @server.application_team_distro_group
    fill_in "Approved", with: @server.approved
    fill_in "Asset", with: @server.asset
    fill_in "Disk Size", with: @server.disk_size
    fill_in "Eng Team Manager Contact", with: @server.eng_team_manager_contact_id
    fill_in "Eng Team Sme Contact", with: @server.eng_team_sme_contact_id
    fill_in "Environment", with: @server.environment
    fill_in "Hostname", with: @server.hostname
    fill_in "Line Of Business", with: @server.line_of_business
    fill_in "Location", with: @server.location
    fill_in "Os Requested", with: @server.os_requested
    fill_in "User", with: @server.user_id
    fill_in "Virtual Machine", with: @server.virtual_machine
    click_on "Update Server"

    assert_text "Server was successfully updated"
    click_on "Back"
  end

  test "destroying a Server" do
    visit servers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Server was successfully destroyed"
  end
end
