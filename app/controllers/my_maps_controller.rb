class MyMapsController < ApplicationController
  def index
    @map = MyMap.new
    @maps = MyMap.all
  end

  def show
    @map = MyMap.find(params[:id])
    @markers = @map.markers
    @hash = Gmaps4rails.build_markers(@markers) do |marker, coords|
      coords.lat marker.latitude
      coords.lng marker.longitude
    end
  end

  def create
    @map = MyMap.new(map_params)
    if @map.save
      flash[:success] = "Success!"
      redirect_to root_path
    else
      flash.now[:error] = "Map's name can't be empty"
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

  def send_mail
    @person = Person.new(name: params[:name], phone: params[:phone], email: params[:email])
    map = MyMap.find(params[:my_map_id])
    link = request.original_url 
    respond_to do |format|
      if @person.save
        flash.now[:success] = "Map link was sent to your email"             
        format.js {}
        format.html { redirect_ro root_path}
        Sender.map_to_email(@person, map, link).deliver     
      else
        format.js { render :status => 422, json: {:errors => @person.errors.full_messages} } 
      end
    end
  end

  private
  def map_params
    params.require(:my_map).permit(:title)
  end
end
