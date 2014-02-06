class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @test = Test.find(params[:test_id])
    @items = @test.items.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @test = Test.find(params[:test_id])
  end

  # GET /items/new
  def new
    @test = Test.find(params[:test_id])
    @item = @test.items.new
  end

  # GET /items/1/edit
  def edit
    @test = Test.find(params[:test_id])
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @test = Test.find(params[:test_id])
    @item = @test.items.new(item_params)
    respond_to do |format|
      if @item.save
        format.html { redirect_to [@test, @item], notice: 'Test item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    @test = Test.find(params[:test_id])
    @item = Item.find(params[:id])
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to [@test, @item], notice: 'Test item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:test_id, :full_name, :short_name, :depends_on_age, :depends_on_gender, :units, :low_range, :high_range, :laboratory_id, :start_date, :end_date)
    end
end
