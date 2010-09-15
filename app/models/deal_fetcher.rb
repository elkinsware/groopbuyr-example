class DealFetcher
  def initialize
    @api = deal_source_api.new
  end
  
  def fetch
    City.all.each do |city|
      puts "fetching deals for #{city.name} - #{city.code}\n"
      begin
        @api.deals(city.code).each do |dd_deal|
          Deal.create_or_update_from_api(city.code, dd_deal)
        end
      rescue Crack::ParseError
        puts "JSON Parsing issue for #{city.name} - #{city.code}\n"
      end
      sleep(1)
    end
  end
  
  protected
    def deal_source_api
      GroopBuyr
    end
end