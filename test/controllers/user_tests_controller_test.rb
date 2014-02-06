require 'test_helper'

class UserTestsControllerTest < ActionController::TestCase
  setup do
    @user_test = user_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_test" do
    assert_difference('UserTest.count') do
      post :create, user_test: { doctor_id: @user_test.doctor_id, laboratory_id: @user_test.laboratory_id, test_date: @user_test.test_date, test_id: @user_test.test_id, user_id: @user_test.user_id }
    end

    assert_redirected_to user_test_path(assigns(:user_test))
  end

  test "should show user_test" do
    get :show, id: @user_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_test
    assert_response :success
  end

  test "should update user_test" do
    patch :update, id: @user_test, user_test: { doctor_id: @user_test.doctor_id, laboratory_id: @user_test.laboratory_id, test_date: @user_test.test_date, test_id: @user_test.test_id, user_id: @user_test.user_id }
    assert_redirected_to user_test_path(assigns(:user_test))
  end

  test "should destroy user_test" do
    assert_difference('UserTest.count', -1) do
      delete :destroy, id: @user_test
    end

    assert_redirected_to user_tests_path
  end
end
