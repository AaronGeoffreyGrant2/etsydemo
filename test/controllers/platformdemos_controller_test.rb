require 'test_helper'

class PlatformdemosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @platformdemo = platformdemos(:one)
  end

  test "should get index" do
    get platformdemos_url
    assert_response :success
  end

  test "should get new" do
    get new_platformdemo_url
    assert_response :success
  end

  test "should create platformdemo" do
    assert_difference('Platformdemo.count') do
      post platformdemos_url, params: { platformdemo: { Demo: @platformdemo.Demo, coin: @platformdemo.coin, enmey: @platformdemo.enmey, lava: @platformdemo.lava, player: @platformdemo.player, user_id: @platformdemo.user_id } }
    end

    assert_redirected_to platformdemo_url(Platformdemo.last)
  end

  test "should show platformdemo" do
    get platformdemo_url(@platformdemo)
    assert_response :success
  end

  test "should get edit" do
    get edit_platformdemo_url(@platformdemo)
    assert_response :success
  end

  test "should update platformdemo" do
    patch platformdemo_url(@platformdemo), params: { platformdemo: { Demo: @platformdemo.Demo, coin: @platformdemo.coin, enmey: @platformdemo.enmey, lava: @platformdemo.lava, player: @platformdemo.player, user_id: @platformdemo.user_id } }
    assert_redirected_to platformdemo_url(@platformdemo)
  end

  test "should destroy platformdemo" do
    assert_difference('Platformdemo.count', -1) do
      delete platformdemo_url(@platformdemo)
    end

    assert_redirected_to platformdemos_url
  end
end
