require 'test_helper'

class SystemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @system = systems(:one)
  end

  test "should get index" do
    get systems_url
    assert_response :success
  end

  test "should get new" do
    get new_system_url
    assert_response :success
  end

  test "should create system" do
    assert_difference('System.count') do
      post systems_url, params: { system: { boot_time: @system.boot_time, cpu: @system.cpu, date: @system.date, drives: @system.drives, graphics: @system.graphics, ip: @system.ip, machine: @system.machine, server_id: @system.server_id, system: @system.system } }
    end

    assert_redirected_to system_url(System.last)
  end

  test "should show system" do
    get system_url(@system)
    assert_response :success
  end

  test "should get edit" do
    get edit_system_url(@system)
    assert_response :success
  end

  test "should update system" do
    patch system_url(@system), params: { system: { boot_time: @system.boot_time, cpu: @system.cpu, date: @system.date, drives: @system.drives, graphics: @system.graphics, ip: @system.ip, machine: @system.machine, server_id: @system.server_id, system: @system.system } }
    assert_redirected_to system_url(@system)
  end

  test "should destroy system" do
    assert_difference('System.count', -1) do
      delete system_url(@system)
    end

    assert_redirected_to systems_url
  end
end
