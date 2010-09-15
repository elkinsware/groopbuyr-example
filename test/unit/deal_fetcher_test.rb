require 'test_helper'

class DealFetcherTest < ActiveSupport::TestCase
  
  test "fetch" do
    @fetcher = DealFetcher.new
    @groopbuyr = GroopBuyr.new
    
    @fetcher.fetch
    
    assert_equal @groopbuyr.deals("HOU").size, City.find_by_code("HOU").deals.count
    
    @deal_count = Deal.count
    
    @fetcher.fetch
    
    assert_equal @deal_count, Deal.count
  end
  
end