require 'test_helper'

class CityFetcherTest < ActiveSupport::TestCase
  
  test "fetch" do
    @fetcher = CityFetcher.new
    @groopbuyr = GroopBuyr.new
    
    @fetcher.fetch
    
    assert_equal @groopbuyr.cities.size, City.count
  end
  
end