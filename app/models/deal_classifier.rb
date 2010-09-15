class DealClassifier
  
  def initialize
    @classifier = Classifier::Bayes.new('relevant', 'not_relevant')
  end
  
  def classify
    Deal.not_relevant.each { |deal| @classifier.train_not_relevant(deal.headline) }
    Deal.relevant.each { |deal| @classifier.train_relevant(deal.headline) }
    
    relevant_results = []
    not_relevant_results = []
    
    Deal.undetermined.each do |new_deal|
      if @classifier.classify(new_deal.headline).downcase  == "relevant"
        new_deal.mark_as_relevant!
        relevant_results << new_deal
      else
        new_deal.mark_as_not_relevant!
        not_relevant_results << new_deal
      end
    end  

    send_email_report(relevant_results, not_relevant_results)
  end
  
  protected
    def send_email_report(relevant_results, not_relevant_results)
      RelevanceNotifier.deliver_run_report(relevant_results, not_relevant_results)
    end
    
end