require 'test_helper'

class SpaceshootergamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spaceshootergame = spaceshootergames(:one)
  end

  test "should get index" do
    get spaceshootergames_url
    assert_response :success
  end

  test "should get new" do
    get new_spaceshootergame_url
    assert_response :success
  end

  test "should create spaceshootergame" do
    assert_difference('Spaceshootergame.count') do
      post spaceshootergames_url, params: { spaceshootergame: { enemy: @spaceshootergame.enemy, ship: @spaceshootergame.ship, user_id: @spaceshootergame.user_id } }
    end

    assert_redirected_to spaceshootergame_url(Spaceshootergame.last)
  end

  test "should show spaceshootergame" do
    get spaceshootergame_url(@spaceshootergame)
    assert_response :success
  end

  test "should get edit" do
    get edit_spaceshootergame_url(@spaceshootergame)
    assert_response :success
  end

  test "should update spaceshootergame" do
    patch spaceshootergame_url(@spaceshootergame), params: { spaceshootergame: { enemy: @spaceshootergame.enemy, ship: @spaceshootergame.ship, user_id: @spaceshootergame.user_id } }
    assert_redirected_to spaceshootergame_url(@spaceshootergame)
  end

  test "should destroy spaceshootergame" do
    assert_difference('Spaceshootergame.count', -1) do
      delete spaceshootergame_url(@spaceshootergame)
    end

    assert_redirected_to spaceshootergames_url
  end
end
