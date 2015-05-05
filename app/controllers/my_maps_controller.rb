class MyMapsController < ApplicationController
  def index
    @map = MyMap.new
    @maps = MyMap.all
  end

  def show
    @map = MyMap.find(params[:id])
    @marker = @map.markers.build
    @markers = @map.markers
  end

  def create
    @map = MyMap.new(map_params)
    if @map.save
      redirect_to root_path, notice: "Success!"
    else
      flash.now[:error] = "Map name"
      render "index"
    end 
  end

  def edit
    @map = MyMap.find(params[:id])
  end

  def destroy
    MyMap.find(params[:id]).destroy
    flash[:success] = "Map deleted!"
    redirect_to root_path
  end

  def update
    @map = MyMap.find(params[:id])
    if @map.update_attributes(map_params)
      flash[:success] = "Map updated"
      redirect_to root_path
    else
      flash.now[:error] = "Map's name can't be blank"
      render 'edit'
    end
  end

  private
  def map_params
    params.require(:my_map).permit(:title)
  end
end
