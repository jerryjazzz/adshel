class TripsController < ApplicationController

  def index
    respond_to do |page|
      @trips = if params[:route_id]
        Trip.where(route_id: params[:route_id])
      end

      page.json { render json: @trips }
    end
  end

end
