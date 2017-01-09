require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not be empty" do
    status = Status.new
    assert_not status.valid?
    assert_not status.save
  end
  
  test "should create grafik" do
    status = Status.new(:nazwa => 'ADMIN', :uprawnienia => 1)
    assert status.save
  end
  
  test "should find grafik" do
    status = statuses(:admin).id
    assert_nothing_raised { Status.find(status) }
  end
 
 test "should update department" do
   status = statuses(:admin)
   assert status.update_attributes(:nazwa => "Nowa nazwa")
 end
 
 test "should destroy department" do
   status = statuses(:admin)
   status.destroy
   assert_raise(ActiveRecord::RecordNotFound){ Status.find(status.id)}
 end
end
