class DealsController < ApplicationController
  
  def index
    if params[:filter] == "relevant"
      @deals = Deal.relevant.most_recent.paginate(:page => (params[:page] || 1), :per_page => 25)
    elsif params[:filter] == "not_relevant"
      @deals = Deal.not_relevant.most_recent.paginate(:page => (params[:page] || 1), :per_page => 25)
    elsif params[:filter] == "not_marked"
      @deals = Deal.undetermined.most_recent.paginate(:page => (params[:page] || 1), :per_page => 25)
    else
      @deals = Deal.most_recent.paginate(:page => (params[:page] || 1), :per_page => 25)
    end
  end
  
  def show
    @deal = Deal.find(params[:id])
  end
  
  def near
    #lat: 29.97  lng:  -95.35
    @lat = params[:lat].to_f
    @lng = params[:lng].to_f
    
    if @lat and @lng
      @city = City.find_closest(:origin => [@lat, @lng])
      @deal = @city.deals.active_deals.relevant.first(:order => "rand()")
    else
      return render( :status => 404 )
    end
    
    return render( :status => 404 ) unless @deal
  
    respond_to do |format|
      format.html
      format.xml {render :xml => @deal.to_xml}
      format.json {render :json => @deal.to_json}
    end      
  end
  
  def mark_as_relevant
    @deal = Deal.find(params[:id])
    @deal.mark_as_relevant!
    
    respond_to do |format|
      format.html { redirect_to(@deal) }
      format.js
    end
  end
  
  def mark_as_not_relevant
    @deal = Deal.find(params[:id])
    @deal.mark_as_not_relevant!
    
    respond_to do |format|
      format.html { redirect_to(@deal) }
      format.js
    end
  end
  
end