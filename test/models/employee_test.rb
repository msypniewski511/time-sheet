require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should create the employee" do
    employee = Employee.new
    employee.email = 'example1@example.com'
    employee.password = 'secret'
    employee.shift_id = shifts(:RT000).id
    employee.status_id = statuses(:admin).id
    employee.department_id = departments(:ship).id
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
  
  def new_employee(email)
    Employee.new(email: email,
    password: 'haslo',
    shift_id: 1,
    status_id: 1,
    department_id: 1)
  end
  
  test "email should be in correct format" do
    ok = %w{example@employee.com EXAMPLE@XXX.XX}
    bad = %w{example.com exampl@example}
    
    ok.each do |email|
      assert new_employee(email).valid?
    end
    
    bad.each do |email|
      assert new_employee(email).invalid?
    end
  end
  
  test "email should be unique" do
    employee = Employee.new(email: employees(:maciej).email,
    password: 'haslo',
    shift_id: 1,
    status_id: 1,
    department_id: 1)
    assert !employee.save
  end
end

