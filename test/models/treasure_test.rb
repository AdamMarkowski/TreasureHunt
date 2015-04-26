require 'test_helper'

class TreasureTest < ActiveSupport::TestCase
  test 'create coordinates' do
    treasure      = Treasure.new
    treasure.long = 50.051227
    treasure.lat  = -19.945704
    assert treasure.save!

    treasure.reload
    assert_equal 50.051227, treasure.longtitude
    assert_equal -19.945704, treasure.latitude
  end

  test 'create coordinates that include compass' do
    treasure      = Treasure.new
    treasure.long = '50.051227 S'
    treasure.lat  = '19.945704 W'
    assert treasure.save!

    treasure.reload
    assert_equal -50.051227, treasure.longtitude
    assert_equal -19.945704, treasure.latitude
  end

  test 'check geocoder' do
    treasure      = Treasure.new
    treasure.long = 50.051227
    treasure.lat  = -19.945704
    assert treasure.save!

    assert_equal [-19.945704, 50.051227], treasure.to_coordinates
  end
end
