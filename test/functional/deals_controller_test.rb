require 'test_helper'

# TODO: write test for near (html, json, and xml)
# TODO: write test for mark_as_relevant (html and js)
# TODO: write test for mark_as_not_relevant (html and js)

class DealsControllerTest < ActionController::TestCase
  
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Deal.first
    assert_template 'show'
  end
  
end