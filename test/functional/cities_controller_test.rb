require 'test_helper'

class CitiesControllerTest < ActionController::TestCase
  
  def test_index
    get :index
    assert_template 'index'
    assert_response :success
  end
  
  def test_show
    get :show, :id => cities(:sfo).id
    assert_template 'show'
    assert_response :success
  end
  
  def test_show_by_city_code
    get :show, :id => cities(:sfo).code
    assert_template 'show'
    assert_response :success    
  end

  def test_show_by_city_name
    get :show, :id => cities(:sfo).name.parameterize
    assert_template 'show'    
    assert_response :success
  end

  def test_random_deal_html
    get :random_deal, :id => cities(:sfo).code
    assert_template 'random_deal'        
    assert_not_nil assigns["deal"]
    assert_response :success
  end
  
  def test_random_deal_json
    get :random_deal, :id => cities(:sfo).code, :format => 'json'
    assert_equal @request.format, :json
    assert_not_nil assigns["deal"]
    assert_response :success
  end
  
  def test_random_deal_xml
    get :random_deal, :id => cities(:sfo).code, :format => 'xml'
    assert_equal @request.format, :xml
    assert_not_nil assigns["deal"]
    assert_response :success
  end
  
end