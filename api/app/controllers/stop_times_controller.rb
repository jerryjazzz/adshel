class StopTimesController < ApplicationController

  def index
    respond_to do |page|
      if StopTime.where(stop_id: params[:stop_id]).blank?
        response = AucklandTransportApi.stop_times(params[:stop_id])
        AucklandTransportApi.create_or_update(response, StopTime, :arrival_time)
      end

      page.json { render json: StopTime.where(stop_id: params[:stop_id]).order(:arrival_time) }      
    end
  end

end
