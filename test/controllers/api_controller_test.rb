require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test 'check correct coordinates' do
    create_treasure

    post :check_coordinates, {longtitude: 50.051227, latitude: 19.945704, email: 'sad@asd.pl'}
    assert_response :success

    response = JSON.parse(@response.body)
    assert_equal 'ok', response['status']
    assert_equal 0.0, response['distance']
  end

  test 'check correct compass coordinates' do
    create_treasure

    post :check_coordinates, {longtitude: '50.051227 N', latitude: '19.945704 E', email: 'sad@asd.pl'}
    assert_response :success

    response = JSON.parse(@response.body)
    assert_equal 'ok', response['status']
    assert_equal 0.0, response['distance']
  end

  test 'check less than 5 meters radius coordinates' do
    create_treasure

    post :check_coordinates, {longtitude: 50.051240, latitude: 19.945730, email: 'sad@asd.pl'}
    assert_response :success

    response = JSON.parse(@response.body)
    assert_equal 'ok', response['status']
    assert_equal 3, response['distance']
  end

  test 'check less than 5 meters radius compass coordinates' do
    create_treasure

    post :check_coordinates, {longtitude: '50.051240 N', latitude: '19.945730 E', email: 'sad@asd.pl'}
    assert_response :success

    response = JSON.parse(@response.body)
    assert_equal 'ok', response['status']
    assert_equal 3, response['distance']
  end

  test 'check more than 5 meters radius coordinates' do
    create_treasure

    post :check_coordinates, {longtitude: 50.051260, latitude: 19.945750, email: 'sad@asd.pl'}
    assert_response :success

    response = JSON.parse(@response.body)
    assert_equal 'ok', response['status']
    assert_equal 6, response['distance']
  end

  test 'check more than 5 meters radius coordinates compass' do
    create_treasure

    post :check_coordinates, {longtitude: '50.051260 N', latitude: '19.945750 E', email: 'sad@asd.pl'}
    assert_response :success

    response = JSON.parse(@response.body)
    assert_equal 'ok', response['status']
    assert_equal 6, response['distance']
  end

  test 'wrong parameters' do
    create_treasure

    post :check_coordinates, {longtitude: 'a', latitude: 19, email: 'sad@asd.pl'}
    assert_response :success

    response = JSON.parse(@response.body)
    # { “status”: “error”, “distance”: -1, “error”: “error description” }
    assert_equal 'error', response['status']
    assert_equal -1, response['distance']
    assert_equal 'error description', response['error']
  end

  test 'should increase founded number' do
    create_treasure

    post :check_coordinates, {longtitude: 50.051227, latitude: 19.945704, email: 'sad@asd.pl'}
    assert_response :success

    response = JSON.parse(@response.body)
    assert_equal 'ok', response['status']
    assert_equal 0.0, response['distance']
    assert_equal assigns(:treasure).founded, 1
  end
end
