require 'test_helper'

class OptionShiftsControllerTest < ActionController::TestCase
  setup do
    @option_shift = option_shifts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:option_shifts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create option_shift" do
    assert_difference('OptionShift.count') do
      post :create, option_shift: { color: @option_shift.color, description: @option_shift.description, option: @option_shift.option }
    end

    assert_redirected_to option_shift_path(assigns(:option_shift))
  end

  test "should show option_shift" do
    get :show, id: @option_shift
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @option_shift
    assert_response :success
  end

  test "should update option_shift" do
    patch :update, id: @option_shift, option_shift: { color: @option_shift.color, description: @option_shift.description, option: @option_shift.option }
    assert_redirected_to option_shift_path(assigns(:option_shift))
  end

  test "should destroy option_shift" do
    assert_difference('OptionShift.count', -1) do
      delete :destroy, id: @option_shift
    end

    assert_redirected_to option_shifts_path
  end
end
