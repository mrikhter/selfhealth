class NormalRangesController < ApplicationController
  before_action :set_normal_range, only: [:edit, :update, :destroy]
  before_action :set_item, except: [:destroy]
  before_action :set_test, except: [:destroy]

  def index
    @normal_ranges = @item.normal_ranges
  end

  def new
    @normal_range = @item.normal_ranges.new
  end

  def edit
  end

  def create
    @normal_range = @item.normal_ranges.new(normal_range_params)
    if @normal_range.save
      redirect_to test_item_normal_ranges_path, notice: 'Normal range was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @normal_range.update(normal_range_params)
      redirect_to test_item_normal_ranges_path, notice: 'Normal range was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @normal_range.destroy
    redirect_to test_item_normal_ranges_url
  end

  private
    def set_normal_range
      @normal_range = NormalRange.find(params[:id])
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

    def set_test
      @test = Test.find_by_cpt_code(params[:test_id])
    end

    def normal_range_params
      params.require(:normal_range).permit(:low, :high, :laboratory_id, :start_date, :end_date, :gender)
    end
end
