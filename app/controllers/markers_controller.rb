class MarkersController < ApplicationController
	def create
		@map = MyMap.find(params[:my_map_id])
		@marker = @map.markers.build(markers_params)
		if @marker.save
			flash[:success] = "Marker has been created"
			redirect_to @map
		else
			render @map
		end 
	end
	def destroy
		Marker.find(params[:id]).destroy
		redirect_to my_map_path(params[:my_map_id])
	end

	def markers_params
		params.require(:marker).permit(:longitude, :latitude, :title, :description)
	end
end
