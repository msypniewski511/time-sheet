require 'test_helper'

class ShiftsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  setup do
    @shift = shifts(:RT000)
    @update = {
      nazwa: 'RT101',
      grafik_id: 3
    }
  end
  test "should get index shifts" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shifts)
  end
  
  test "should get show shift" do
    get :show, id: @shift.id
    assert_response :success
  end
  
  test "should get new shift" do
    get :new
    assert_response :success
  end
  
  test "should create shift" do
    assert_difference('Shift.count') do
      post :create, shift: @update
    end
    assert_response :redirect
  end
  
  test "shoud get edit shift" do
    get :edit, id: @shift
    assert_response :success
  end
  
  test "shoud update shift" do
    patch :update, id: @shift, shift: @update
    assert_response :redirect
  end
  
  test "should destroy shift" do
    assert_difference('Shift.count', -1) do
      delete :destroy, id: @shift
    end
    assert_response :redirect
  end
end
