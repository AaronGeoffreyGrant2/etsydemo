require 'test_helper'

class SpaceshootersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spaceshooter = spaceshooters(:one)
  end

  test "should get index" do
    get spaceshooters_url
    assert_response :success
  end

  test "should get new" do
    get new_spaceshooter_url
    assert_response :success
  end

  test "should create spaceshooter" do
    assert_difference('Spaceshooter.count') do
      post spaceshooters_url, params: { spaceshooter: { Game: @spaceshooter.Game, enemyships: @spaceshooter.enemyships, playership: @spaceshooter.playership, user_id: @spaceshooter.user_id } }
    end

    assert_redirected_to spaceshooter_url(Spaceshooter.last)
  end

  test "should show spaceshooter" do
    get spaceshooter_url(@spaceshooter)
    assert_response :success
  end

  test "should get edit" do
    get edit_spaceshooter_url(@spaceshooter)
    assert_response :success
  end

  test "should update spaceshooter" do
    patch spaceshooter_url(@spaceshooter), params: { spaceshooter: { Game: @spaceshooter.Game, enemyships: @spaceshooter.enemyships, playership: @spaceshooter.playership, user_id: @spaceshooter.user_id } }
    assert_redirected_to spaceshooter_url(@spaceshooter)
  end

  test "should destroy spaceshooter" do
    assert_difference('Spaceshooter.count', -1) do
      delete spaceshooter_url(@spaceshooter)
    end

    assert_redirected_to spaceshooters_url
  end
end
