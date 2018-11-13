require 'test_helper'

class ServersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @server = servers(:one)
  end

  test "should get index" do
    get servers_url
    assert_response :success
  end

  test "should get new" do
    get new_server_url
    assert_response :success
  end

  test "should create server" do
    assert_difference('Server.count') do
      post servers_url, params: { server: { application_director_id: @server.application_director_id, application_manager_id: @server.application_manager_id, application_sme_id: @server.application_sme_id, application_team_distro_group: @server.application_team_distro_group, approved: @server.approved, asset: @server.asset, disk_size: @server.disk_size, eng_team_manager_contact_id: @server.eng_team_manager_contact_id, eng_team_sme_contact_id: @server.eng_team_sme_contact_id, environment: @server.environment, hostname: @server.hostname, line_of_business: @server.line_of_business, location: @server.location, os_requested: @server.os_requested, user_id: @server.user_id, virtual_machine: @server.virtual_machine } }
    end

    assert_redirected_to server_url(Server.last)
  end

  test "should show server" do
    get server_url(@server)
    assert_response :success
  end

  test "should get edit" do
    get edit_server_url(@server)
    assert_response :success
  end

  test "should update server" do
    patch server_url(@server), params: { server: { application_director_id: @server.application_director_id, application_manager_id: @server.application_manager_id, application_sme_id: @server.application_sme_id, application_team_distro_group: @server.application_team_distro_group, approved: @server.approved, asset: @server.asset, disk_size: @server.disk_size, eng_team_manager_contact_id: @server.eng_team_manager_contact_id, eng_team_sme_contact_id: @server.eng_team_sme_contact_id, environment: @server.environment, hostname: @server.hostname, line_of_business: @server.line_of_business, location: @server.location, os_requested: @server.os_requested, user_id: @server.user_id, virtual_machine: @server.virtual_machine } }
    assert_redirected_to server_url(@server)
  end

  test "should destroy server" do
    assert_difference('Server.count', -1) do
      delete server_url(@server)
    end

    assert_redirected_to servers_url
  end
end
