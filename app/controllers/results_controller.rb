class ResultsController < ApplicationController
  before_action :set_result, only: [:update, :destroy]
  before_action :set_user_test, only: [:index, :new, :edit_multiple, :create]

  def index
    @items = @user_test.test.items
    @results = @user_test.results.joins(:item).order("items.full_name")
    @results_json = @results.map {|result| {:id => result.id, :amount => result.amount, :units => result.item.units, :low_range => result.item.normal_ranges.first.low, :high_range => result.item.normal_ranges.first.high }}
    respond_to do |format|
      format.html
      format.json { render :json => @results_json }
      format.js
    end
  end

  def new
    @items = @user_test.items
    @results = @user_test.results.build
    # @result = @user_test.results.new
    # @results = @items.count.times { @user_test.results.build }
  end

  def edit_multiple
    @results = @user_test.results.joins(:item).order("items.full_name")
  end

  def update_multiple
    params[:result].keys.each do |id|
      @result = Result.find(id.to_i)
      @result.update_attribute(:amount, params[:result][id][:amount])
    end
    redirect_to(user_test_results_path)
  end

  def create
    result_params[:result].each do |record|
      @user_test.results.create(record)
    end
    redirect_to user_test_results_path, notice: 'Results were successfully created.'
  end

  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to user_user_test_results_url }
      format.json { head :no_content }
    end
  end

  private
    def set_result
      @result = Result.find(params[:id])
    end

    def set_user_test
      @user_test = UserTest.find(params[:user_test_id])
    end

    def result_params
      params.permit(:user_test_id, :result => [:item_id, :amount])
    end
end
