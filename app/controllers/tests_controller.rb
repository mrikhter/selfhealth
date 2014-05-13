class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]
  # respond_to :html, :xml, :json, :js

  def index
    @tests = Test.all
  end

  def new
    if current_user.admin?
      @test = Test.new
    else
      redirect_to tests_path
    end
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to tests_path, notice: 'Test was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @test.update(test_params)
      redirect_to tests_path, notice: 'Test was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_url, notice: 'Test was successfully destroyed.'
  end

  private
    def set_test
      @test = Test.find(params[:id])
      # @test = Test.find_by_cpt_code(params[:id])
    end

    def test_params
      params.require(:test).permit(:full_name, :short_name, :cpt_code, :test_type_id)
    end
end
