require 'test_helper'

class TestItemsControllerTest < ActionController::TestCase
  setup do
    @test_item = test_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_item" do
    assert_difference('TestItem.count') do
      post :create, test_item: { depends_on_age: @test_item.depends_on_age, depends_on_gender: @test_item.depends_on_gender, end_date: @test_item.end_date, full_name: @test_item.full_name, high_range: @test_item.high_range, laboratory_id: @test_item.laboratory_id, low_range: @test_item.low_range, short_name: @test_item.short_name, start_date: @test_item.start_date, test_id: @test_item.test_id, units: @test_item.units }
    end

    assert_redirected_to test_item_path(assigns(:test_item))
  end

  test "should show test_item" do
    get :show, id: @test_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_item
    assert_response :success
  end

  test "should update test_item" do
    patch :update, id: @test_item, test_item: { depends_on_age: @test_item.depends_on_age, depends_on_gender: @test_item.depends_on_gender, end_date: @test_item.end_date, full_name: @test_item.full_name, high_range: @test_item.high_range, laboratory_id: @test_item.laboratory_id, low_range: @test_item.low_range, short_name: @test_item.short_name, start_date: @test_item.start_date, test_id: @test_item.test_id, units: @test_item.units }
    assert_redirected_to test_item_path(assigns(:test_item))
  end

  test "should destroy test_item" do
    assert_difference('TestItem.count', -1) do
      delete :destroy, id: @test_item
    end

    assert_redirected_to test_items_path
  end
end
