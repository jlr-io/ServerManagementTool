require 'test_helper'

class ModificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @modification = modifications(:one)
  end

  test "should get index" do
    get modifications_url
    assert_response :success
  end

  test "should get new" do
    get new_modification_url
    assert_response :success
  end

  test "should create modification" do
    assert_difference('Modification.count') do
      post modifications_url, params: { modification: { comments: @modification.comments, delete_server: @modification.delete_server, edit_server: @modification.edit_server, server_id: @modification.server_id, user_id: @modification.user_id } }
    end

    assert_redirected_to modification_url(Modification.last)
  end

  test "should show modification" do
    get modification_url(@modification)
    assert_response :success
  end

  test "should get edit" do
    get edit_modification_url(@modification)
    assert_response :success
  end

  test "should update modification" do
    patch modification_url(@modification), params: { modification: { comments: @modification.comments, delete_server: @modification.delete_server, edit_server: @modification.edit_server, server_id: @modification.server_id, user_id: @modification.user_id } }
    assert_redirected_to modification_url(@modification)
  end

  test "should destroy modification" do
    assert_difference('Modification.count', -1) do
      delete modification_url(@modification)
    end

    assert_redirected_to modifications_url
  end
end
