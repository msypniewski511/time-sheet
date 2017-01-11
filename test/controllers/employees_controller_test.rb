require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  fixtures :departments, :grafiks, :shifts, :statuses
  setup do
    @employee = employees(:maciej)
    @update = {
      email: 'example2@gmail.com',
      password: 'haslo',
      shift_id: 2,
      status_id: 2,
      department_id: 2
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post :create, employee: @update
    end

    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should show employee" do
    #get :show, id: @employee
    #assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee
    assert_response :success
  end

  test "should update employee" do
    post :update, id: @employee, employee: { email: @employee.email, password: @employee.password, shift_id: @employee.shift_id, status_id: @employee.status_id }
    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete :destroy, id: @employee
    end

    assert_redirected_to employees_path
  end
end
