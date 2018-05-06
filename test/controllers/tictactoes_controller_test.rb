require 'test_helper'

class TictactoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tictacto = tictactoes(:one)
  end

  test "should get index" do
    get tictactoes_url
    assert_response :success
  end

  test "should get new" do
    get new_tictacto_url
    assert_response :success
  end

  test "should create tictacto" do
    assert_difference('Tictactoe.count') do
      post tictactoes_url, params: { tictacto: { Game: @tictacto.Game, os: @tictacto.os, user_id: @tictacto.user_id, xs: @tictacto.xs } }
    end

    assert_redirected_to tictacto_url(Tictactoe.last)
  end

  test "should show tictacto" do
    get tictacto_url(@tictacto)
    assert_response :success
  end

  test "should get edit" do
    get edit_tictacto_url(@tictacto)
    assert_response :success
  end

  test "should update tictacto" do
    patch tictacto_url(@tictacto), params: { tictacto: { Game: @tictacto.Game, os: @tictacto.os, user_id: @tictacto.user_id, xs: @tictacto.xs } }
    assert_redirected_to tictacto_url(@tictacto)
  end

  test "should destroy tictacto" do
    assert_difference('Tictactoe.count', -1) do
      delete tictacto_url(@tictacto)
    end

    assert_redirected_to tictactoes_url
  end
end
