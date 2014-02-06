class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @user_test = UserTest.find(params[:user_test_id])
    @items = UserTest.find(params[:user_test_id]).test.items
    @results = @user_test.results
  end

  def show
    @user = User.find(params[:user_id])
    @user_test = UserTest.find(params[:user_test_id])
  end

  def new
    @items = UserTest.find(params[:user_test_id]).test.items
    @user = User.find(params[:user_id])
    @user_test = UserTest.find(params[:user_test_id])
    @result = @user_test.results.new
    @results = @items.count.times {@user_test.results.build}
  end

  def edit
  end

  def create
    @user = User.find(params[:user_id])
    @user_test = UserTest.find(params[:user_test_id])
    result_params[:result].each do |record|
      @user_test.results.create(record)
    end
    redirect_to [@user, @user_test], notice: 'Results were successfully created.' 
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
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.permit(:user_test_id, :result => [:item_id, :amount])
    end
end
