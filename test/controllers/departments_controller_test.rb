require 'test_helper'

class DepartmentsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @department = departments(:ship)
  end
  
  test "shuld get index department" do
    get :index
    assert_response :success
    assert_not_nil assigns(:departments)
  end
  
  test "shuold get show department" do
    get :show, id: @department
    assert_response :success
  end
  
  test "shoud get new department" do
    get :new
    assert_response :success
  end
  
  test "should create department" do
    assert_difference('Department.count') do
      post :create, department: {nazwa: 'HR'}
    end
    assert_response :redirect
  end
  
  test "should get edit department" do
    get :edit, id: @department
    assert_response :success
  end
  
  test "should update department" do
    patch :update, id: @department, department: {nazwa: "hr"}
    assert_response :redirect
  end
  
  test "should deswtroy department" do
    assert_difference('Department.count', - 1) do
      delete :destroy, id: @department
    end
    assert_response :redirect
  end
  
end
