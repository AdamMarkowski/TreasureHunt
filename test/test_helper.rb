ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start 'rails'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def create_treasure
    treasure      = Treasure.new
    treasure.long = '50.051227 N'
    treasure.lat  = '19.945704 E'
    assert treasure.save!

    treasure.reload
    assert_equal 50.051227, treasure.longtitude
    assert_equal 19.945704, treasure.latitude
  end

  def create_token
    token = Token.create(token: 'sdfsdUFI&FYTUVHOIB')
    token.token
  end
end
