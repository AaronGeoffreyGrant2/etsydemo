require 'test_helper'

class PlatformgamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @platformgame = platformgames(:one)
  end

  test "should get index" do
    get platformgames_url
    assert_response :success
  end

  test "should get new" do
    get new_platformgame_url
    assert_response :success
  end

  test "should create platformgame" do
    assert_difference('Platformgame.count') do
      post platformgames_url, params: { platformgame: { coin: @platformgame.coin, enemy: @platformgame.enemy, lava: @platformgame.lava, levelbackground: @platformgame.levelbackground, levelplatform: @platformgame.levelplatform, player: @platformgame.player, playerbeatslevel: @platformgame.playerbeatslevel, playerdies: @platformgame.playerdies, user_id: @platformgame.user_id } }
    end

    assert_redirected_to platformgame_url(Platformgame.last)
  end

  test "should show platformgame" do
    get platformgame_url(@platformgame)
    assert_response :success
  end

  test "should get edit" do
    get edit_platformgame_url(@platformgame)
    assert_response :success
  end

  test "should update platformgame" do
    patch platformgame_url(@platformgame), params: { platformgame: { coin: @platformgame.coin, enemy: @platformgame.enemy, lava: @platformgame.lava, levelbackground: @platformgame.levelbackground, levelplatform: @platformgame.levelplatform, player: @platformgame.player, playerbeatslevel: @platformgame.playerbeatslevel, playerdies: @platformgame.playerdies, user_id: @platformgame.user_id } }
    assert_redirected_to platformgame_url(@platformgame)
  end

  test "should destroy platformgame" do
    assert_difference('Platformgame.count', -1) do
      delete platformgame_url(@platformgame)
    end

    assert_redirected_to platformgames_url
  end
end
