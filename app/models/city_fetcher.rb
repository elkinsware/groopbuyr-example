class CityFetcher
  def initialize
    @api = deal_source_api.new
  end
  
  def fetch
    @api.cities.each do |dd_city|
      City.create_from_api_if_does_not_exist(dd_city)
      sleep(1)
    end
  end
  
  protected
    def deal_source_api
      GroopBuyr
    end
end