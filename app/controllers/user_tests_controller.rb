class UserTestsController < ApplicationController
  before_action :set_user_test, only: [:show, :edit, :update, :destroy]

  def index
    @user_tests = current_user.user_tests.order("test_date DESC")
  end

  def show
  end

  def new
    @user_test = current_user.user_tests.new
  end

  def edit
  end

  def create
    @user_test = current_user.user_tests.new(user_test_params)

    respond_to do |format|
      if @user_test.save
        format.html { redirect_to new_user_test_result_path(@user_test), notice: 'User test was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_test }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_test.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user_test.update(user_test_params)
        format.html { redirect_to  @user_test, notice: 'User test was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_test.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_test.destroy
    respond_to do |format|
      format.html { redirect_to user_tests_url }
      format.json { head :no_content }
    end
  end

  private
    def set_user_test
      @user_test = UserTest.find(params[:id])
    end

    def user_test_params
      params.require(:user_test).permit(:user_id, :test_id, :laboratory_id, :doctor_id, :test_date)
    end
end
