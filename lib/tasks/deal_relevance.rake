namespace :deals do
  desc "check deal relevance"
  task :relevance => :environment do
    classifier = DealClassifier.new
    classifier.classify
  end  
end