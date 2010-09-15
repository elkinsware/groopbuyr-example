class DealsLinkRender < WillPaginate::LinkRenderer
    # Process it! This method returns the complete HTML string which contains
    # pagination links. Feel free to subclass LinkRenderer and change this
    # method as you see fit.
    def to_html
      links = @options[:page_links] ? windowed_links : []
      # previous/next buttons
      
      unless current_page == 1
        links.unshift page_link_or_span(@collection.previous_page, 'disabled prev_page', @options[:previous_label])
      end
      
      unless total_pages == current_page
        links.push page_link_or_span(@collection.next_page, 'disabled next_page', @options[:next_label])
      end
      
      html = links.join(@options[:separator])
      @options[:container] ? @template.content_tag(:div, html, html_attributes) : html
    end
end