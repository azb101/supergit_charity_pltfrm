require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get main" do
    get :main
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get play" do
    get :play
    assert_response :success
  end

  test "should get people" do
    get :people
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

end
