require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    test "should not be empty" do
    shift = Shift.new
    assert_not shift.valid?
    assert_not shift.save
  end
  
  test "should create grafik" do
    shift = Shift.new(:nazwa => 'RT000')
    assert shift.save
  end
  
  test "should find grafik" do
    shift = shifts(:RT000).id
    assert_nothing_raised { Shift.find(shift) }
  end
 
 test "should update department" do
   shift = shifts(:RT000)
   assert shift.update_attributes(:nazwa => "Nowa nazwa")
 end
 
 test "should destroy department" do
   shift = shifts(:RT000)
   shift.destroy
   assert_raise(ActiveRecord::RecordNotFound){ Shift.find(shift.id)}
 end
end
