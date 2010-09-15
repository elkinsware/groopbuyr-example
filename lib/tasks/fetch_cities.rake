namespace :cities do
  desc "fetch cities from api"
  task :fetch => :environment do
    @fetcher = CityFetcher.new
    @fetcher.fetch
  end  
end