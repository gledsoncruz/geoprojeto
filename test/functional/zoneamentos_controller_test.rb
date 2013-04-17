require 'test_helper'

class ZoneamentosControllerTest < ActionController::TestCase
  setup do
    @zoneamento = zoneamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zoneamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zoneamento" do
    assert_difference('Zoneamento.count') do
      post :create, :zoneamento => { :atividade => @zoneamento.atividade, :desc => @zoneamento.desc, :sigla => @zoneamento.sigla }
    end

    assert_redirected_to zoneamento_path(assigns(:zoneamento))
  end

  test "should show zoneamento" do
    get :show, :id => @zoneamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @zoneamento
    assert_response :success
  end

  test "should update zoneamento" do
    put :update, :id => @zoneamento, :zoneamento => { :atividade => @zoneamento.atividade, :desc => @zoneamento.desc, :sigla => @zoneamento.sigla }
    assert_redirected_to zoneamento_path(assigns(:zoneamento))
  end

  test "should destroy zoneamento" do
    assert_difference('Zoneamento.count', -1) do
      delete :destroy, :id => @zoneamento
    end

    assert_redirected_to zoneamentos_path
  end
end
