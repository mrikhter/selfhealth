class ResultsController < ApplicationController
  before_action :set_result, only: [:update, :destroy]
  before_action :set_user_test, only: [:index, :new, :edit, :create]

  def index
    @items = @user_test.test.items
    @results = @user_test.results
    @results_json = @results.map {|result| {:id => result.id, :amount => result.amount, :units => result.item.units, :low_range => result.item.normal_ranges.first.low, :high_range => result.item.normal_ranges.first.high }}
    respond_to do |format|
      format.html
      format.json { render :json => @results_json }
      format.js
    end
  end

  def new
    @items = @user_test.items
    @result = @user_test.results.new
    @results = @items.count.times {@user_test.results.build}
  end

  def edit
    # binding.pry
    # @user = User.find(params[:user_id])
    @result = @user_test.results
    @results = @user_test.results
  end

  def create
    @user = current_user
    result_params[:result].each do |record|
      @user_test.results.create(record)
    end
    redirect_to user_test_results_path, notice: 'Results were successfully created.' 
    # @result = @user_test.results.new(result_params[:result])

    # respond_to do |format|
    #   if @results.save
    #     format.html { redirect_to [@user, @user_test, @result], notice: 'Result was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @result }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @result.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to @result, notice: 'Result was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
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
