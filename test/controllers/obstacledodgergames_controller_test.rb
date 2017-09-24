require 'test_helper'

class ObstacledodgergamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @obstacledodgergame = obstacledodgergames(:one)
  end

  test "should get index" do
    get obstacledodgergames_url
    assert_response :success
  end

  test "should get new" do
    get new_obstacledodgergame_url
    assert_response :success
  end

  test "should create obstacledodgergame" do
    assert_difference('Obstacledodgergame.count') do
      post obstacledodgergames_url, params: { obstacledodgergame: { dodgerimage: @obstacledodgergame.dodgerimage } }
    end

    assert_redirected_to obstacledodgergame_url(Obstacledodgergame.last)
  end

  test "should show obstacledodgergame" do
    get obstacledodgergame_url(@obstacledodgergame)
    assert_response :success
  end

  test "should get edit" do
    get edit_obstacledodgergame_url(@obstacledodgergame)
    assert_response :success
  end

  test "should update obstacledodgergame" do
    patch obstacledodgergame_url(@obstacledodgergame), params: { obstacledodgergame: { dodgerimage: @obstacledodgergame.dodgerimage } }
    assert_redirected_to obstacledodgergame_url(@obstacledodgergame)
  end

  test "should destroy obstacledodgergame" do
    assert_difference('Obstacledodgergame.count', -1) do
      delete obstacledodgergame_url(@obstacledodgergame)
    end

    assert_redirected_to obstacledodgergames_url
  end
end
