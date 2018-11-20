require "application_system_test_case"

class ModificationsTest < ApplicationSystemTestCase
  setup do
    @modification = modifications(:one)
  end

  test "visiting the index" do
    visit modifications_url
    assert_selector "h1", text: "Modifications"
  end

  test "creating a Modification" do
    visit modifications_url
    click_on "New Modification"

    fill_in "Comments", with: @modification.comments
    fill_in "Delete Server", with: @modification.delete_server
    fill_in "Edit Server", with: @modification.edit_server
    fill_in "Server", with: @modification.server_id
    fill_in "User", with: @modification.user_id
    click_on "Create Modification"

    assert_text "Modification was successfully created"
    click_on "Back"
  end

  test "updating a Modification" do
    visit modifications_url
    click_on "Edit", match: :first

    fill_in "Comments", with: @modification.comments
    fill_in "Delete Server", with: @modification.delete_server
    fill_in "Edit Server", with: @modification.edit_server
    fill_in "Server", with: @modification.server_id
    fill_in "User", with: @modification.user_id
    click_on "Update Modification"

    assert_text "Modification was successfully updated"
    click_on "Back"
  end

  test "destroying a Modification" do
    visit modifications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Modification was successfully destroyed"
  end
end
