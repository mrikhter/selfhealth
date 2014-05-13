class TestTypesController < ApplicationController

  def index
    @test_types = TestType.all
  end

  def new
    @test_type = TestType.new
  end

  def edit
  end

  def create
    @test_type = TestType.new(test_type_params)
    if @test_type.save
      redirect_to test_types_path, notice: 'Test Type was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
  end

  private

    def set_test_type
      @test_type = TestType.find(params[:id])
    end

    def test_type_params
      params.require(:test_type).permit(:name)
    end
end
