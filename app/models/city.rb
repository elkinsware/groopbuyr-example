class City < ActiveRecord::Base
  acts_as_mappable
  
  has_many :deals
   
  before_validation_on_create :geocode_address
  
  def to_param
    "#{name.parameterize}"
  end
  
  def self.create_from_api_if_does_not_exist(dd_city)
    unless City.find_by_code(dd_city.cityCode)
      city = City.new(:name => dd_city.cityName, :code => dd_city.cityCode)
      city.save
    end
  end
  
  private
    def geocode_address
      geo=Geokit::Geocoders::MultiGeocoder.geocode(name)
      errors.add(:address, "Could not Geocode address") if !geo.success
      self.lat, self.lng, self.state = geo.lat,geo.lng, geo.state if geo.success      
    end
  
end