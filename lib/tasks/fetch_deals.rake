namespace :deals do
  desc "fetch deals from api"
  task :fetch => :environment do
    @fetcher = DealFetcher.new
    @fetcher.fetch
  end  
end