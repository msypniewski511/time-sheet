require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should create the employee" do
    employee = Employee.new
    employee.email = 'example@example.com'
    employee.password = 'secret'
    employee.shift_id = shifts(:RT000)
    employee.status_id = statuses(:admin)
    employee.department_id = departments(:ship)
    assert employee.save
  end
  
  test "should find employee" do
    employee_id = employees(:maciej).id
    assert_nothing_raised { Employee.find(employee_id) }
  end
  
  test "should update employee" do
    employee = employees(:maciej)
    assert employee.update_attributes(:shift_id => 2)
  end
  
  test "should destroy employee" do
    employee = employees(:maciej)
    employee.destroy
    assert_raise(ActiveRecord::RecordNotFound){ Employee.find(employee.id)}
  end
  
  test "shuld not create employee without requaire data" do
    employee = Employee.new
    assert !employee.valid?
    assert employee.errors[:email].any?
    assert employee.errors[:password].any?
    assert employee.errors[:shift_id].any?
    assert employee.errors[:status_id].any?
    assert employee.errors[:department_id].any?
    assert !employee.save
  end
  
end

