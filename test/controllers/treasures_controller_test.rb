require 'test_helper'

class TreasuresControllerTest < ActionController::TestCase
  setup do
    @treasure = treasures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:treasures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create treasure" do
    assert_difference('Treasure.count') do
      post :create, treasure: {lat: @treasure.latitude, long: @treasure.longtitude}
    end

    assert_redirected_to treasure_path(assigns(:treasure))
  end

  test "should show treasure" do
    get :show, id: @treasure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @treasure
    assert_response :success
  end

  test "should update treasure" do
    patch :update, id: @treasure, treasure: {lat: @treasure.latitude, long: @treasure.longtitude}
    assert_redirected_to treasure_path(assigns(:treasure))
  end

  test "should destroy treasure" do
    assert_difference('Treasure.count', -1) do
      delete :destroy, id: @treasure
    end

    assert_redirected_to treasures_path
  end

  test "should accept coordinates that include compas point" do
    assert_difference('Treasure.count') do
      post :create, treasure: {lat: '50.051227 S', long: '19.945704 E'}
    end

    assert_equal assigns(:treasure).longtitude, 19.945704
    assert_equal assigns(:treasure).latitude, -50.051227

    assert_redirected_to treasure_path(assigns(:treasure))
  end
end
