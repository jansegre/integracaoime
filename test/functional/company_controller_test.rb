require 'test_helper'

class CompanyControllerTest < ActionController::TestCase
  test "should get resumes" do
    get :resumes
    assert_response :success
  end

  test "should get calendars" do
    get :calendars
    assert_response :success
  end

  test "should get how_to" do
    get :how_to
    assert_response :success
  end

  test "should get sponsor" do
    get :sponsor
    assert_response :success
  end

  test "should get feedback" do
    get :feedback
    assert_response :success
  end

  test "should get highlight" do
    get :highlight
    assert_response :success
  end

end
