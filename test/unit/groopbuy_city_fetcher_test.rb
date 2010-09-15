require 'test_helper'

class GroopbuyCityFetcherTest < ActiveSupport::TestCase
  
  test "fetch" do
    @fetcher = GroopbuyCityFetcher.new
    @groopbuyr = GroopBuyr.new
    
    @fetcher.fetch
    
    assert_equal @groopbuyr.cities.size, City.count
  end
  
end