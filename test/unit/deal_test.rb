require 'test_helper'

class DealTest < ActiveSupport::TestCase
  
  test "test utc to local comparison" do
    @deal = deals(:sfo_zozi_deal)
    Time.zone = @deal.time_zone
    
    assert_equal "2010-07-26 06:59:00".to_time(:utc), @deal.expires_at
    assert_equal "2010-07-26 01:59:00".to_time(:local), @deal.expires_at.localtime
  end
  
  test "relevant named_scope" do
    @deals = Deal.relevant
    assert_equal 3, @deals.size
  end
  
  test "not relevant named_scope" do
    @deals = Deal.not_relevant
    assert_equal 2, @deals.size
  end
  
  test "undetermined named_scope" do
    @deals = Deal.undetermined
    assert_equal 1, @deals.size
  end
end