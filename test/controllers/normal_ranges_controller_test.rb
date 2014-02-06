require 'test_helper'

class NormalRangesControllerTest < ActionController::TestCase
  setup do
    @normal_range = normal_ranges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:normal_ranges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create normal_range" do
    assert_difference('NormalRange.count') do
      post :create, normal_range: { end_date: @normal_range.end_date, high: @normal_range.high, laboratory_id: @normal_range.laboratory_id, low: @normal_range.low, start_date: @normal_range.start_date }
    end

    assert_redirected_to normal_range_path(assigns(:normal_range))
  end

  test "should show normal_range" do
    get :show, id: @normal_range
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @normal_range
    assert_response :success
  end

  test "should update normal_range" do
    patch :update, id: @normal_range, normal_range: { end_date: @normal_range.end_date, high: @normal_range.high, laboratory_id: @normal_range.laboratory_id, low: @normal_range.low, start_date: @normal_range.start_date }
    assert_redirected_to normal_range_path(assigns(:normal_range))
  end

  test "should destroy normal_range" do
    assert_difference('NormalRange.count', -1) do
      delete :destroy, id: @normal_range
    end

    assert_redirected_to normal_ranges_path
  end
end
