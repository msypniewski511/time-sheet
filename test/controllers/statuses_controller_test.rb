require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @status = statuses(:admin)
    @update = {
      nazwa: 'pracownik',
      uprawnienia: '2'
    }
  end
  
  test "should get index status" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end
  
  test "should get show status" do
    get :show, id: @status.id
    assert_response :success
  end
  
  test "should get new status" do
    get :new
    assert_response :success
  end
  
  test "shuld create status" do
    assert_difference('Status.count') do
      post :create, status: @update
    end
    #assert_response :redirect
  end
  
  test "should update status" do
    patch :update, id: @status, status: @update
    assert_response :redirect
  end
  
  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end

    assert_response :redirect
  end
end
