require 'test_helper'

# TODO: write test for random_deal (html, json, and xml)

class CitiesControllerTest < ActionController::TestCase
  
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => City.first.id
    assert_template 'show'
  end
  
  def test_show_by_city_code
    get :show, :id => City.first.code
    assert_template 'show'    
  end

  def test_show_by_city_name
    get :show, :id => City.first.name.parameterize
    assert_template 'show'    
  end

end