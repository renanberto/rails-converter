require 'test_helper'

class ConvertsControllerTest < ActionController::TestCase
  setup do
    @convert = converts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:converts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create convert" do
    assert_difference('Convert.count') do
      post :create, convert: { description: @convert.description, name: @convert.name, picture: @convert.picture }
    end

    assert_redirected_to convert_path(assigns(:convert))
  end

  test "should show convert" do
    get :show, id: @convert
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @convert
    assert_response :success
  end

  test "should update convert" do
    patch :update, id: @convert, convert: { description: @convert.description, name: @convert.name, picture: @convert.picture }
    assert_redirected_to convert_path(assigns(:convert))
  end

  test "should destroy convert" do
    assert_difference('Convert.count', -1) do
      delete :destroy, id: @convert
    end

    assert_redirected_to converts_path
  end
end
