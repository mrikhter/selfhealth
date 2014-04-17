class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_test, except: [:destroy]

  def index
    @items = @test.items.all
  end

  def new
    @item = @test.items.new
  end

  def edit
  end

  # def edit_multiple
  #   @items = Item.find(params[:item_ids])
  # end

  # def update_multiple
  #   @items = Item.find(params[:item_ids])
  #   redirect_to test_items_path
  # end

  def create
    @item = @test.items.new(item_params)
    if @item.save
      redirect_to test_items_path, notice: 'Test item was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @item.update(item_params)
      redirect_to test_items_path, notice: 'Test item was successfully updated.'
        else
      render action: 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to items_url
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def set_test
      @test = Test.find_by_cpt_code(params[:test_id])
    end

    def item_params
      params.require(:item).permit(:test_id, :full_name, :short_name, :depends_on_age, :depends_on_gender, :units, :low_range, :high_range, :laboratory_id, :start_date, :end_date)
    end
end
