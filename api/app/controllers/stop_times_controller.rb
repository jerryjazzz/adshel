class StopTimesController < ApplicationController

  def index
    respond_to do |page|
      stop_times = []

      if params[:stop_id]
        # TODO: This lazy download strategy no longer works as some, but not all, stop times
        # could have been downloaded due to being downloaded by trip
        # if StopTime.where(stop_id: params[:stop_id]).blank?
          response = AucklandTransportApi.stop_times_by_stop(params[:stop_id])
          AucklandTransportApi.create_or_update(response, StopTime, :arrival_time)
        # end
        stop_times = StopTime.where(stop_id: params[:stop_id])
      elsif params[:trip_id]
        # if StopTime.where(trip_id: params[:trip_id]).blank?
          response = AucklandTransportApi.stop_times_by_trip(params[:trip_id])
          AucklandTransportApi.create_or_update(response, StopTime, :arrival_time)
        # end
        stop_times = StopTime.where(trip_id: params[:trip_id])
      end

      page.json { render json: stop_times.order(:arrival_time) }
    end
  end

end
