class StopsController < ApplicationController
  caches_page :index

  def index
    respond_to do |page|
      page.json { render json: Stop.all }
    end
  end

end
