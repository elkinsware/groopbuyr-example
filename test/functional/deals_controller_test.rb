require 'test_helper'

# TODO: write test for mark_as_relevant (html and js)
# TODO: write test for mark_as_not_relevant (html and js)

class DealsControllerTest < ActionController::TestCase
  
  def test_index
    get :index
    assert_template 'index'
    assert_response :success
  end
  
  def test_show
    get :show, :id => Deal.first
    assert_template 'show'
    assert_response :success
  end
  
  def test_near_html
    get :near, :lat => -122.4194155, :lng => 37.7749295
    assert_template 'near'   
    assert_not_nil assigns["deal"]
    assert_response :success
  end
  
  def test_near_json
    get :near, :lat => -122.4194155 , :lng => 37.7749295, :format => 'json'
    assert_equal @request.format, :json
    assert_not_nil assigns["deal"]
    assert_response :success
  end
  
  def test_near_xml
    get :near, :lat => -122.4194155 , :lng => 37.7749295, :format => 'xml'
    assert_equal @request.format, :xml
    assert_not_nil assigns["deal"]
    assert_response :success
  end
  
  def test_mark_as_relevant
    put :mark_as_relevant, :id => deals(:sfo_zozi_deal).id
    assert_response :redirect
  end
  
  def test_mark_as_not_relevant
    put :mark_as_not_relevant, :id => deals(:sfo_zozi_deal).id
    assert_response :redirect
  end
  
  def test_mark_as_relevant_js
    xhr :put, :mark_as_relevant, :id => deals(:sfo_zozi_deal).id
    assert_response :success
  end
  
  def test_mark_as_not_relevant_js
    xhr :put, :mark_as_not_relevant, :id => deals(:sfo_zozi_deal).id
    assert_response :success
  end
end