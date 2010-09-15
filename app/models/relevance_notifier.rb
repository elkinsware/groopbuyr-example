class RelevanceNotifier < ActionMailer::Base

  def run_report(relevant_results, not_relevant_results)
    recipients APP_CONFIG[:report_recipient]
    from        APP_CONFIG[:report_sender]
    subject    "Relevance Report for #{Time.now.to_s(:db)}"
    body       :relevant_results => relevant_results, :not_relevant_results => not_relevant_results
  end

end
