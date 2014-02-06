class NormalRangesController < ApplicationController
  before_action :set_normal_range, only: [:show, :edit, :update, :destroy]

  # GET /normal_ranges
  # GET /normal_ranges.json
  def index
    @test = Test.find(params[:test_id])
    @item = Item.find(params[:item_id])
    @normal_ranges = @item.normal_ranges
  end

  # GET /normal_ranges/1
  # GET /normal_ranges/1.json
  def show
    @test = Test.find(params[:test_id])
    @item = Item.find(params[:item_id])
  end

  # GET /normal_ranges/new
  def new
    @test = Test.find(params[:test_id])
    @item = Item.find(params[:item_id])
    @normal_range = @item.normal_ranges.new
  end

  # GET /normal_ranges/1/edit
  def edit
    @test = Test.find(params[:test_id])
    @item = Item.find(params[:test_id])
    @normal_range = NormalRange.find(params[:id])
  end

  # POST /normal_ranges
  # POST /normal_ranges.json
  def create
    @test = Test.find(params[:test_id])
    @item = Item.find(params[:item_id])
    @normal_range = @item.normal_ranges.new(normal_range_params)

    respond_to do |format|
      if @normal_range.save
        format.html { redirect_to [@test, @item, @normal_range], notice: 'Normal range was successfully created.' }
        format.json { render action: 'show', status: :created, location: @normal_range }
      else
        format.html { render action: 'new' }
        format.json { render json: @normal_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /normal_ranges/1
  # PATCH/PUT /normal_ranges/1.json
  def update
    @test = Test.find(params[:test_id])
    @item = Item.find(params[:test_id])
    @normal_range = NormalRange.find(params[:id])
    respond_to do |format|
      if @normal_range.update(normal_range_params)
        format.html { redirect_to [@test, @item, @normal_range], notice: 'Normal range was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @normal_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /normal_ranges/1
  # DELETE /normal_ranges/1.json
  def destroy
    @normal_range.destroy
    respond_to do |format|
      format.html { redirect_to test_item_normal_ranges_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_normal_range
      @normal_range = NormalRange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def normal_range_params
      params.require(:normal_range).permit(:low, :high, :laboratory_id, :start_date, :end_date, :gender)
    end
end
