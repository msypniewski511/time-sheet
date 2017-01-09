require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not be empty" do
    department = Department.new
    assert_not department.valid?
    assert_not department.save
  end
  
  test "should create department" do
    department = Department.new(:nazwa => 'Ship')
    assert department.save
  end
  
  test "should find department" do
    dep_id = departments(:ship).id
    assert_nothing_raised { Department.find(dep_id) }
  end
 
 test "should update department" do
   department = departments(:ship)
   assert department.update_attributes(:nazwa => "Nowa nazwa")
 end
 
 test "should destroy department" do
   department = departments(:ship)
   department.destroy
   assert_raise(ActiveRecord::RecordNotFound){ Department.find(department.id)}
 end
end
