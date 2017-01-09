require 'test_helper'

class GrafikTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not be empty" do
    grafik = Grafik.new
    assert_not grafik.valid?
    assert_not grafik.save
  end
  
  test "should create grafik" do
    grafik = Grafik.new(:nazwa => 'Ship')
    assert grafik.save
  end
  
  test "should find grafik" do
    grafik_id = grafiks(:rt).id
    assert_nothing_raised { Grafik.find(grafik_id) }
  end
 
 test "should update department" do
   grafik = grafiks(:rt)
   assert grafik.update_attributes(:nazwa => "Nowa nazwa")
 end
 
 test "should destroy department" do
   grafik = grafiks(:rt)
   grafik.destroy
   assert_raise(ActiveRecord::RecordNotFound){ Grafik.find(grafik.id)}
 end
end
