require 'test_helper'

class TictactoegamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tictactoegame = tictactoegames(:one)
  end

  test "should get index" do
    get tictactoegames_url
    assert_response :success
  end

  test "should get new" do
    get new_tictactoegame_url
    assert_response :success
  end

  test "should create tictactoegame" do
    assert_difference('Tictactoegame.count') do
      post tictactoegames_url, params: { tictactoegame: { os: @tictactoegame.os, user_id: @tictactoegame.user_id, xs: @tictactoegame.xs } }
    end

    assert_redirected_to tictactoegame_url(Tictactoegame.last)
  end

  test "should show tictactoegame" do
    get tictactoegame_url(@tictactoegame)
    assert_response :success
  end

  test "should get edit" do
    get edit_tictactoegame_url(@tictactoegame)
    assert_response :success
  end

  test "should update tictactoegame" do
    patch tictactoegame_url(@tictactoegame), params: { tictactoegame: { os: @tictactoegame.os, user_id: @tictactoegame.user_id, xs: @tictactoegame.xs } }
    assert_redirected_to tictactoegame_url(@tictactoegame)
  end

  test "should destroy tictactoegame" do
    assert_difference('Tictactoegame.count', -1) do
      delete tictactoegame_url(@tictactoegame)
    end

    assert_redirected_to tictactoegames_url
  end
end
