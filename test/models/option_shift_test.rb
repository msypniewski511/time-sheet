require 'test_helper'

class OptionShiftTest < ActiveSupport::TestCase
  fixtures :option_shifts
  
  setup do
    @option = option_shifts(:one)
    @update = {
      option: "dniowka",
      color: "red",
      description: "opis"
    }
  end
  # test "the truth" do
  #   assert true
  # end
  test "shoud be not empty any attributs" do
    options = OptionShift.new
    assert_not options.valid?
    assert options.errors[:option].any?
    assert options.errors[:color].any?
    assert options.errors[:description].any?
    assert_not options.save
  end
  
  test "should create new option" do
    option = OptionShift.new
    option.option = "nocka"
    option.color = "#ffffff"
    option.description = "god: 15:00 do 23:00"
    assert option.save
  end
  
  test "shuld find options" do
    option_id = option_shifts(:two).id
    assert_nothing_raised { OptionShift.find(option_id) }
  end
  
  test "should update options" do
    option = option_shifts(:one)
    assert option.update_attributes(@update)
  end
  
  test "shuold destroy option" do
    option = option_shifts(:one)
    assert option.destroy
    assert_raise(ActiveRecord::RecordNotFound){ OptionShift.find(option.id) }
  end
  
end
