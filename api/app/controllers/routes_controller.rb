class RoutesController < ApplicationController

  def index
    respond_to do |page|
      @routes = if params[:q]
        Route.where('route_long_name LIKE :q OR route_short_name LIKE :q', q: "%#{params[:q]}%")
      end

      page.json { render json: @routes.order(:route_long_name) }
    end
  end

end
