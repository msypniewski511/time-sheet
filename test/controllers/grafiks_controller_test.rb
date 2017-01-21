require 'test_helper'

class GrafiksControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  setup do
    @shift = shifts(:RT000)
    @grafik = grafiks(:rt)
    @update = {
      shift_id: 3,
      nazwa: "BLU",
      dane: "dane_wej"
    }
  end
  
  test "shoud get index" do
    #get "/shifts/#{@shift.id}/grafiks"
    get :index, shift_id: @grafik.id
    assert_response :success
    assert_not_nil assigns(@grafiks)
  end
  
  #test "should get show" do
  #  get :show, shift_id: @grafik.shift_id, id: @grafik.id
  #  assert_response :success
  #end
  
  test "shoud create grafik" do
    assert_difference('Grafik.count') do
      post :create, shift_id: @grafik.id, :grafik => {:shift_id => 1, :nazwa => "nazwa", :dane => "dane"}
    end
    #assert_difference('Grafik.count') do
    #  post :create, shift_id: @shift.id, @update
    #end
    assert_response :redirect
  end
  
  test "Should destroy grafik" do
    assert_difference('Grafik.count', -1) do
      delete :destroy, shift_id: @grafik.id, :id => @grafik.to_param
    end
    assert_response :redirect
  end
end
