class CitiesController < ApplicationController
  def index
    @cities = City.all
    
    respond_to do |format|
      format.html
      format.xml {render :xml => @cities.to_xml}
      format.json {render :json => @cities.to_json}
    end
  end
  
  def show
    load_city
    
    return render(:status => 404) unless @city
    
    @per_page = params[:per_page] ? params[:per_page].to_i : 25
    @per_page = 25 if @per_page == 0
    @per_page = 100 if @per_page > 100
    
    @deals = @city.deals.active_deals.most_recent.paginate(:page => (params[:page] || 1), :per_page => @per_page)
    
    respond_to do |format|
      format.html
      format.xml {render :xml => @deals.to_xml}
      format.json {render :json => @deals.to_json}
    end
  end

  def random_deal
    load_city
    
    return render(:status => 404) unless @city
        
    @deal = @city.deals.active_deals.relevant.first(:order => "rand()")
    
    respond_to do |format|
      format.html
      format.xml {render :xml => @deal.to_xml}
      format.json {render :json => @deal.to_json}
    end    
  end
  
  protected
    def load_city
      if params[:id].to_i > 0
        @city = City.find(params[:id])
      else
        unless @city = City.find_by_code(params[:id])
          @city = City.find_by_name(params[:id].gsub("-"," ").humanize)
        end
      end    
    end
end