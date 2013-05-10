require 'test_helper'

class PontosOnibusControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get _onibus" do
    get :_onibus
    assert_response :success
  end

end
