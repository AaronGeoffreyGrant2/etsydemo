require 'test_helper'

class PlatformsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @platform = platforms(:one)
  end

  test "should get index" do
    get platforms_url
    assert_response :success
  end

  test "should get new" do
    get new_platform_url
    assert_response :success
  end

  test "should create platform" do
    assert_difference('Platform.count') do
      post platforms_url, params: { platform: { Game: @platform.Game, coin: @platform.coin, enemy_1: @platform.enemy_1, enemy_2: @platform.enemy_2, enemy_3: @platform.enemy_3, lava: @platform.lava, player: @platform.player, user_id: @platform.user_id } }
    end

    assert_redirected_to platform_url(Platform.last)
  end

  test "should show platform" do
    get platform_url(@platform)
    assert_response :success
  end

  test "should get edit" do
    get edit_platform_url(@platform)
    assert_response :success
  end

  test "should update platform" do
    patch platform_url(@platform), params: { platform: { Game: @platform.Game, coin: @platform.coin, enemy_1: @platform.enemy_1, enemy_2: @platform.enemy_2, enemy_3: @platform.enemy_3, lava: @platform.lava, player: @platform.player, user_id: @platform.user_id } }
    assert_redirected_to platform_url(@platform)
  end

  test "should destroy platform" do
    assert_difference('Platform.count', -1) do
      delete platform_url(@platform)
    end

    assert_redirected_to platforms_url
  end
end
