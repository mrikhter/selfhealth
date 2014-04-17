class LaboratoriesController < ApplicationController
  before_action :set_laboratory, only: [:show, :edit, :update, :destroy]

  def index
    @laboratories = Laboratory.all
  end

  def new
    @laboratory = Laboratory.new
  end

  def create
    @laboratory = Laboratory.new(laboratory_params)
    if @laboratory.save
      redirect_to @laboratory, notice: 'Laboratory was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @laboratory.update(laboratory_params)
      redirect_to @laboratory, notice: 'Laboratory was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @laboratory.destroy
    redirect_to laboratories_url
  end

  private
    def set_laboratory
      @laboratory = Laboratory.find(params[:id])
    end

    def laboratory_params
      params.require(:laboratory).permit(:name)
    end
end
