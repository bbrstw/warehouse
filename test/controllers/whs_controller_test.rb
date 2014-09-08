require 'test_helper'

class WhsControllerTest < ActionController::TestCase
  setup do
    @wh = whs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:whs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wh" do
    assert_difference('Wh.count') do
      post :create, wh: { account_id: @wh.account_id, code: @wh.code, description: @wh.description, name: @wh.name }
    end

    assert_redirected_to wh_path(assigns(:wh))
  end

  test "should show wh" do
    get :show, id: @wh
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wh
    assert_response :success
  end

  test "should update wh" do
    patch :update, id: @wh, wh: { account_id: @wh.account_id, code: @wh.code, description: @wh.description, name: @wh.name }
    assert_redirected_to wh_path(assigns(:wh))
  end

  test "should destroy wh" do
    assert_difference('Wh.count', -1) do
      delete :destroy, id: @wh
    end

    assert_redirected_to whs_path
  end
end
