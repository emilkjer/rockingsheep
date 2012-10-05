require 'test_helper'

class InterestedsControllerTest < ActionController::TestCase
  setup do
    @interested = interesteds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interesteds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interested" do
    assert_difference('Interested.count') do
      post :create, interested: { email: @interested.email, ip: @interested.ip }
    end

    assert_redirected_to interested_path(assigns(:interested))
  end

  test "should show interested" do
    get :show, id: @interested
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interested
    assert_response :success
  end

  test "should update interested" do
    put :update, id: @interested, interested: { email: @interested.email, ip: @interested.ip }
    assert_redirected_to interested_path(assigns(:interested))
  end

  test "should destroy interested" do
    assert_difference('Interested.count', -1) do
      delete :destroy, id: @interested
    end

    assert_redirected_to interesteds_path
  end
end
