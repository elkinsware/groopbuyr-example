class Deal < ActiveRecord::Base
  belongs_to :city
  
  acts_as_mappable :through => :city
  
  named_scope :relevant, :conditions => { :relevant => true }
  named_scope :not_relevant, :conditions => { :relevant => false }
  named_scope :undetermined, :conditions => "deals.relevant IS NULL"
  
  named_scope :most_recent, :order => "deals.created_at DESC"
  named_scope :active_deals, :conditions => ["deals.expires_at <= ?",Time.now.utc.to_s(:db)]
    
  def savings
    @savings ||= (self.value - self.amount)
  end
    
  def self.create_or_update_from_api(city_code, gb_deal)
    current_time_zone = Time.zone
    Time.zone = gb_deal.dealExpirationDateTimeZone
    
    if deal = Deal.find_by_source_id(calculate_source_id(gb_deal))
      expires_at = nil
      if gb_deal.dealExpirationDateTime
        expires_at = gb_deal.dealExpirationDateTime.to_time(:local).utc
      end
      
      if gb_deal.dealHeadline
        deal.update_attributes( :source => gb_deal.dealSource,
                                                :expires_at => expires_at,
                                                :image_url => gb_deal.dealImageUrl,
                                                :headline => gb_deal.dealHeadline,
                                                :time_zone => gb_deal.dealExpirationDateTimeZone,
                                                :url => gb_deal.dealUrl,
                                                :amount => gb_deal.dealAmount,
                                                :source_url => gb_deal.dealSourceUrl,
                                                :value => gb_deal.dealValue)
      end
    else
      expires_at = nil
      if gb_deal.dealExpirationDateTime
        expires_at = gb_deal.dealExpirationDateTime.to_time(:local).utc
      end

      if gb_deal.dealHeadline
        deal = Deal.new( :source => gb_deal.dealSource,
                                    :expires_at => expires_at,
                                    :image_url => gb_deal.dealImageUrl,
                                    :headline => gb_deal.dealHeadline,
                                    :time_zone => gb_deal.dealExpirationDateTimeZone,
                                    :url => gb_deal.dealUrl,
                                    :amount => gb_deal.dealAmount,
                                    :source_url => gb_deal.dealSourceUrl,
                                    :value => gb_deal.dealValue,
                                    :source_id => calculate_source_id(gb_deal),
                                    :city_code => city_code,
                                    :city => City.find_by_code(city_code))
        deal.save      
      end
      #puts "deal.expires_at = #{deal.expires_at} ... deal.expires_at.localtime = #{deal.expires_at.localtime} ... gb_deal.dealExpirationDateTime = #{gb_deal.dealExpirationDateTime}\n"
    end
    
    Time.zone = current_time_zone
  end
  
  def mark_as_relevant!
    update_attribute(:relevant, true)
  end
  
  def mark_as_not_relevant!
    update_attribute(:relevant, false)
  end
  
  protected
    def self.calculate_source_id(gb_deal)
      Digest::MD5.hexdigest("#{gb_deal.dealSource}||#{gb_deal.dealUrl}")
    end
end