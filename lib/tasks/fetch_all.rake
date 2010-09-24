namespace :fetch do
  desc "fetch cities, deals from api and then run relevance"
  task :all => :environment do
    Rake::Task["cities:fetch"].invoke
    Rake::Task["deals:fetch"].invoke
    Rake::Task["deals:relevance"].invoke
  end  
end